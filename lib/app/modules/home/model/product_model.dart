// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:aimart_admin/app/data/helper/product_category.dart';
import 'package:aimart_admin/app/modules/home/model/review_model.dart';

class Product {
  String productId;
  String productName;
  String productType;
  double productPrice;
  double? oldPrice;
  List<String> productImages;
  ProductCategory productCategory;
  Tagtype productTag;
  String description;
  List<String> colors;
  List<String> sizes;
  Rating? rating;
  Product({
    required this.productId,
    required this.productName,
    required this.productType,
    required this.productPrice,
    this.oldPrice,
    required this.productCategory,
    required this.productImages,
    required this.productTag,
    required this.description,
    required this.colors,
    required this.sizes,
    this.rating,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productName': productName,
      'productType': productType,
      'productPrice': productPrice,
      'oldPrice': oldPrice,
      'productImages': productImages,
      'productTag': productTag.index,
      'description': description,
      'colors': colors,
      'sizes': sizes,
      'rating': rating?.toMap(),
      'productCategory': productCategory.index
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productId: map['productId'] as String,
      productName: map['productName'] as String,
      productType: map['productType'] as String,
      productPrice: map['productPrice'] as double,
      oldPrice: map['oldPrice'] != null ? map['oldPrice'] as double : null,
      productImages: List<String>.from((map['productImages'] as List<String>)),
      productTag: Tagtype.values[map['productTag']],
      productCategory: ProductCategory.values[map['productCategory']],
      description: map['description'] as String,
      colors: List<String>.from((map['colors'] as List<String>)),
      sizes: List<String>.from((map['sizes'] as List<String>)),
      rating: map['rating'] != null
          ? Rating.fromMap(map['rating'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}

List<String> sizeList = [
  'XXL',
  'XL',
  'L',
  'M',
  'S',
];
List<String> color = [
  '#FFFFFF',
  '#FF0000',
  '#00FF00.',
  '#000000',
  '#0000FF',
];
