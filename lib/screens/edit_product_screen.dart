import 'package:flutter/material.dart';
class EditProductScreen extends StatelessWidget {

  static const routeName = '/edit_poduct';

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