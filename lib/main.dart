import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_shop/providers/auth.dart';
import 'package:real_shop/providers/cart.dart';
import 'package:real_shop/providers/orders.dart';
import 'package:real_shop/providers/product.dart';
import 'package:real_shop/providers/products.dart';
import 'package:real_shop/screens/auth_screen.dart';
import 'package:real_shop/screens/cart_screen.dart';
import 'package:real_shop/screens/edit_product_screen.dart';
import 'package:real_shop/screens/order_screen.dart';
import 'package:real_shop/screens/product_detail_screen.dart';
import 'package:real_shop/screens/product_overview_screen.dart';
import 'package:real_shop/screens/user_products_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(value: Orders()),
        ChangeNotifierProvider.value(value: Product()),
        ChangeNotifierProvider.value(value: Products()),
      ],
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: AuthScreeen(),
        routes: {
          ProductDetailScreen.routeName: (_) => ProductDetailScreen(),
          CartScreen.routeName: (_) => CartScreen(),
          OrderScreen.routeName: (_) => CartScreen(),
          EditProductScreen.routeName: (_) => EditProductScreen(),
          UserProductScreen.routeName: (_) => UserProductScreen(),
        },
      ),
    );
  }
}
