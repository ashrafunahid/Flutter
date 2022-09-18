import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchAndSetOrders() async {
    Uri uri = Uri.parse('https://shop-app-using-provider-1e5f3-default-rtdb.firebaseio.com/orders.json');
    final response = await http.get(uri);
    // print(json.decode(response.body));
    final List<OrderItem> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if(extractedData == null){
      return;
    }
    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(
        OrderItem(
            id: orderId, 
            amount: orderData['amount'], 
            products: (orderData['products'] as List<dynamic>).map((e) => CartItem(
              id: e['id'],
              price: e['price'],
              quantity: e['quantity'],
              title: e['title']
            )).toList(),
            dateTime: DateTime.parse(orderData['dateTime']),
        )
      );
    });
    _orders = loadedOrders.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    Uri uri = Uri.parse('https://shop-app-using-provider-1e5f3-default-rtdb.firebaseio.com/orders.json');
    final timestamp = DateTime.now();
    final response = await http.post(uri, body: json.encode({
      'amount': total,
      'dateTime': timestamp.toIso8601String(),
      'products': cartProducts.map((e) => {
        'id': e.id,
        'title': e.title,
        'quantity': e.quantity,
        'price': e.price,
      }).toList()
    }),);
    _orders.insert(
      0,
      OrderItem(
        id: json.decode(response.body)['name'],
        amount: total,
        dateTime: timestamp,
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
