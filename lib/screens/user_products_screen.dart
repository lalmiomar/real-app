import 'package:flutter/material.dart';
import 'package:real_shop/widgets/app_drawer.dart';
class UserProductScreen extends StatelessWidget {

  static const routeName = '/user-product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Screen"),
      ),
      body: Center(
        child: Text("Order Screen"),
      ),
      drawer: AppDrawer(),
    );
  }
}