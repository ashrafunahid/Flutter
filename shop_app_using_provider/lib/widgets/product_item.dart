import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_using_provider/screens/product_detail_screen.dart';

import '../providers/product.dart';

class ProductItem extends StatelessWidget {

  // final String id;
  // final String title;
  // final String imageUrl;
  //
  // ProductItem({this.id, this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: GridTile(
          child: GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: product.id);
              },
              child: Image.network(product.imageUrl, fit: BoxFit.cover,)),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: Consumer<Product>(
              builder: (context, product, child) => IconButton(
              icon: Icon(product.isFavourite ? Icons.favorite : Icons.favorite_border),
              onPressed: (){
                product.toggleFacouriteStatus();
              },
              color: Theme.of(context).accentColor,
            )),
            title: Text(product.title, textAlign: TextAlign.center,),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: (){},
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
    );
  }
}
