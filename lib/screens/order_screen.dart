import 'package:flutter/material.dart';
class OrderScreen extends StatelessWidget {

  static const routeName = '/order';

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