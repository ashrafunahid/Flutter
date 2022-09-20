import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_using_provider/helpers/custom_route.dart';
import 'package:shop_app_using_provider/providers/auth.dart';
import 'package:shop_app_using_provider/providers/orders.dart';
import 'package:shop_app_using_provider/screens/cart_screen.dart';
import 'package:shop_app_using_provider/screens/edit_product_screen.dart';
import 'package:shop_app_using_provider/screens/orders_screen.dart';
import 'package:shop_app_using_provider/screens/splash_screen.dart';
import 'package:shop_app_using_provider/screens/user_products_screen.dart';
import './providers/cart.dart';
import 'package:shop_app_using_provider/screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';
import './providers/products.dart';
import './screens/auth_screen.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Auth(),
          ),
          ChangeNotifierProxyProvider<Auth, Products>(
            update: (context, auth, previousProducts) => Products(auth.token, auth.userId, previousProducts == null ? [] : previousProducts.items),
          ),
          ChangeNotifierProvider(
            create: (context) => Cart(),
          ),
          ChangeNotifierProxyProvider<Auth, Orders>(
            update: (context, auth, previousOrders) => Orders(auth.token, auth.userId, previousOrders == null ? [] : previousOrders.orders),
          ),
        ],
        child: Consumer<Auth>(
          builder: (context, auth, _) =>  MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'E Commerce using Flutter',
            theme: ThemeData(
              primarySwatch: Colors.purple,
              accentColor: Colors.deepOrange,
              fontFamily: 'Lato',
              pageTransitionsTheme: PageTransitionsTheme(
                builders: {
                  TargetPlatform.android: CustomPageTransitionBuilder(),
                  TargetPlatform.iOS: CustomPageTransitionBuilder(),
                }
              ),
            ),
            home: auth.isAuth ? ProductsOverviewScreen()
                : FutureBuilder(
              future: auth.tryAutoLogin(),
              builder: (context, authResultSnapshot) => authResultSnapshot.connectionState == ConnectionState.waiting ? SplashScreen() : AuthScreen(),
            ),
            routes: {
              ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
              CartScreen.routeName: (context) => CartScreen(),
              OrdersScreen.routeName: (context) => OrdersScreen(),
              UserProductsScreen.routeName: (context) => UserProductsScreen(),
              EditProductScreen.routeName: (context) => EditProductScreen(),
            },
          ),
        ),
    );
  }
}



