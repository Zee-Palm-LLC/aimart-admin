import 'dart:convert';

import 'package:aimart_admin/app/data/helper/product_category.dart';
import 'package:aimart_admin/app/modules/home/model/product_color_model.dart';
import 'package:aimart_admin/app/modules/home/model/product_size_model.dart';
import 'package:aimart_admin/app/modules/home/model/producttag.dart';
import 'package:aimart_admin/app/modules/home/model/review_model.dart';

class Product {
  String productId;
  String? productName;
  String? productType;
  double? productPrice;
  double? oldPrice;
  List<String>? productImages;
  ProductCategory? productCategory;
  ProductTag? productTag;
  String? description;
  List<ProductColor>? colors;
  List<ProductSize>? sizes;
  Rating? rating;
  Product({
    required this.productId,
    this.productName,
    this.productType,
    this.productPrice,
    this.oldPrice,
    this.productImages,
    this.description,
    this.colors,
    this.sizes,
    this.rating,
    this.productCategory,
    this.productTag,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'productId': productId});
    if(productName != null){
      result.addAll({'productName': productName});
    }
    if(productType != null){
      result.addAll({'productType': productType});
    }
    if(productPrice != null){
      result.addAll({'productPrice': productPrice});
    }
    if(oldPrice != null){
      result.addAll({'oldPrice': oldPrice});
    }
    if(productImages != null){
      result.addAll({'productImages': productImages});
    }
    if(description != null){
      result.addAll({'description': description});
    }
    if(colors != null){
      result.addAll({'colors': colors!.map((x) => x.toMap()).toList()});
    }
    if(sizes != null){
      result.addAll({'sizes': sizes!.map((x) => x.toMap()).toList()});
    }
    if(rating != null){
      result.addAll({'rating': rating!.toMap()});
    }
  
    return result;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productId: map['productId'] ?? '',
      productName: map['productName'],
      productType: map['productType'],
      productPrice: map['productPrice']?.toDouble(),
      oldPrice: map['oldPrice']?.toDouble(),
      productImages: List<String>.from(map['productImages']),
      description: map['description'],
      colors: map['colors'] != null ? List<ProductColor>.from(map['colors']?.map((x) => ProductColor.fromMap(x))) : null,
      sizes: map['sizes'] != null ? List<ProductSize>.from(map['sizes']?.map((x) => ProductSize.fromMap(x))) : null,
      rating: map['rating'] != null ? Rating.fromMap(map['rating']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));
}
