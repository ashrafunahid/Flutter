import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_using_provider/providers/orders.dart';
import 'package:shop_app_using_provider/screens/cart_screen.dart';
import 'package:shop_app_using_provider/screens/edit_product_screen.dart';
import 'package:shop_app_using_provider/screens/orders_screen.dart';
import 'package:shop_app_using_provider/screens/user_products_screen.dart';
import './providers/cart.dart';
import 'package:shop_app_using_provider/screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';
import './providers/products.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Products(),
          ),
          ChangeNotifierProvider(
            create: (context) => Cart(),
          ),
          ChangeNotifierProvider(
            create: (context) => Orders(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E Commerce using Flutter',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
            CartScreen.routeName: (context) => CartScreen(),
            OrdersScreen.routeName: (context) => OrdersScreen(),
            UserProductsScreen.routeName: (context) => UserProductsScreen(),
            EditProductScreen.routeName: (context) => EditProductScreen(),
          },
        ),
    );
  }
}



