import 'dart:convert';

import 'package:flutter/material.dart';

class ProductColor {
  Color color;
  ProductColor({
    required this.color,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'color': color.value});

    return result;
  }

  factory ProductColor.fromMap(Map<String, dynamic> map) {
    return ProductColor(
      color: Color(map['color']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductColor.fromJson(String source) =>
      ProductColor.fromMap(json.decode(source));
}
