import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ProductColor {
  String title;
  Color color;
  ProductColor({
    required this.title,
    required this.color,
  });

 

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'title': title});
    result.addAll({'color': color.value});
  
    return result;
  }

  factory ProductColor.fromMap(Map<String, dynamic> map) {
    return ProductColor(
      title: map['title'] ?? '',
      color: Color(map['color']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductColor.fromJson(String source) => ProductColor.fromMap(json.decode(source));
}

List<ProductColor> colours = [
  ProductColor(title: 'White', color: Colors.white),
  ProductColor(title: 'Red', color: Colors.red),
  ProductColor(title: 'Green', color: Colors.green),
  ProductColor(title: 'Black', color: Colors.black),
  ProductColor(title: 'Blue', color: Colors.blue),
];
