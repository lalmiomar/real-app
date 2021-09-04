import 'package:flutter/material.dart';

import 'dart:math';
import 'package:intl/intl.dart';

import '../providers/orders.dart' as ord;

class OrderItem extends StatelessWidget {
  final ord.OrderItem order;

  const OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('\$${order.amount}'),
      subtitle: Text(DateFormat('dd/MM/yyyy hh:mm').format(order.dateTime)),
      children: order.products.map(
        (prod) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${prod.title}x \$${prod.price}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ).toList(),
    );
  }
}
