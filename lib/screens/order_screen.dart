import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:real_shop/widgets/app_drawer.dart';
import '../widgets/order_item.dart';
import '../providers/orders.dart' show Orders;

class OrderScreen extends StatelessWidget {
  static const routeName = '/order';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YourOrder"),
      ),
      drawer: AppDrawer(),
      body:FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        builder: (ctx, AsyncSnapshot snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          } else{
            if(snapshot.error != null){
              return Center(child: Text('Ann error occurred'));
            } else{
              return Consumer<Orders>(builder: (ctx, orderData, child)=> ListView.builder(
                itemCount: orderData.ordres.length,
                itemBuilder: (BuildContext context, int index) => OrderItem(orderData.ordres[index]),
              ),);
            }
          }
        },
      ),
    );
  }
}
