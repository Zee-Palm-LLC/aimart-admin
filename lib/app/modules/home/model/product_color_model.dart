// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class ProductColor {
  String colorCode;
  ProductColor({
    required this.colorCode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'colorCode': colorCode,
    };
  }

  factory ProductColor.fromMap(Map<String, dynamic> map) {
    return ProductColor(
      colorCode: map['colorCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductColor.fromJson(String source) =>
      ProductColor.fromMap(json.decode(source) as Map<String, dynamic>);
}
