import 'package:flutter/material.dart';

class CartProducts extends StatelessWidget {
   CartProducts({super.key});
   static const String id = '/cartProducts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Cart Products'),
      ),
    );
  }
}
