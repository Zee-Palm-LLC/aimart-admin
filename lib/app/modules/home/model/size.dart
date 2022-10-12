import 'dart:convert';

class ProductSize {
  String size;
  ProductSize({
    required this.size,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'size': size});
  
    return result;
  }

  factory ProductSize.fromMap(Map<String, dynamic> map) {
    return ProductSize(
      size: map['size'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductSize.fromJson(String source) => ProductSize.fromMap(json.decode(source));
}
