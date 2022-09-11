import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_using_provider/providers/cart.dart';
import 'package:shop_app_using_provider/screens/cart_screen.dart';
import 'package:shop_app_using_provider/widgets/app_drawer.dart';
import '../widgets/prducts_grid.dart';
import '../providers/products.dart';
import '../widgets/badge.dart';

enum FilterOption{
  Favorites,
  All,
}
class ProductsOverviewScreen extends StatefulWidget {


  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    // final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("E commerce "),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption selectedValue){
              if (selectedValue == FilterOption.Favorites){
                // productsContainer.showFavoritesOnly();
                setState(() {
                  _showOnlyFavorites = true;
                });
              } else {
                // productsContainer.showAll();
                setState(() {
                  _showOnlyFavorites = false;
                });
              }
            },
            icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                PopupMenuItem(
                    child: Text('Only Favorites'),
                  value: FilterOption.Favorites,
                ),
                PopupMenuItem(
                  child: Text('Show All'),
                  value: FilterOption.All,
                ),
              ]
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child:
                IconButton(onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                }, icon: Icon(Icons.shopping_cart)),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}



