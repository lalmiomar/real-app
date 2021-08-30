import 'package:flutter/material.dart';
class ProductDetailScreen extends StatelessWidget {

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Screen"),
      ),
      body: Center(
        child: Text("Order Screen"),
      ),
    );
  }
}