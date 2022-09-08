import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/prducts_grid.dart';
import '../providers/products.dart';

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
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}



