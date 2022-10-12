import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
   const AddProduct({super.key});
  static const String id = '/addproduct';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('AddProduct'),
      ),
    );
  }
}
