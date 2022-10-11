import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/data.dart';
import 'package:food_delivery_app/models/order.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({Key key}) : super(key: key);

  _buildRecentOrder(BuildContext context, Order order){
    return Container(
      margin: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width * .80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          width: 1.0,
          color: Colors.grey[200],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0),
                  ),
                  child: Image(
                    width: MediaQuery.of(context).size.width * .30,
                    height: MediaQuery.of(context).size.height * .20,
                    image: AssetImage(order.food.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(order.food.name, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,),
                        SizedBox(height: 4.0,),
                        Text(order.restaurant.name, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,),
                        SizedBox(height: 4.0,),
                        Text(order.date, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 48.0,
            margin: EdgeInsets.only(right: 20.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30.0)
            ),
            child: IconButton(
              icon: Icon(Icons.add),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: (){},
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Recent Orders',
            style: TextStyle(
                fontSize: 24.0, fontWeight: FontWeight.w600, letterSpacing: 1.2),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * .20,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: currentUser.orders.length,
            itemBuilder: (context, index){
            Order order = currentUser.orders[index];
              return _buildRecentOrder(context, order);
            }
          ),
        ),
      ],
    );
  }
}
