import 'dart:convert';

enum Tagtype { trending, newtype , discount , bestseller}
class ProductTag {
  String tagname;
  Tagtype tagtype;
  ProductTag({
    required this.tagname,
    required this.tagtype,
  });


  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'tagname': tagname});
    result.addAll({'tagtype': tagtype.index});
  
    return result;
  }

  factory ProductTag.fromMap(Map<String, dynamic> map) {
    return ProductTag(
      tagname: map['tagname'] ?? '',
      tagtype: Tagtype.values[(map['tagtype'])],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductTag.fromJson(String source) => ProductTag.fromMap(json.decode(source));
}
