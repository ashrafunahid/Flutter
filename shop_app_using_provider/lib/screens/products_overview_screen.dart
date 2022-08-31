import 'package:flutter/material.dart';
import '../widgets/prducts_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E commerce "),
      ),
      body: ProductsGrid(),
    );
  }
}



