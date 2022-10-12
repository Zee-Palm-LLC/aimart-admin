import 'package:flutter/material.dart';

class DeleteProduct extends StatelessWidget {
   const DeleteProduct({super.key});
  static const String id = '/deleteProduct';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Delete Product'),
      ),
    );
  }
}
