import 'package:aimart_admin/app/data/helper/product_category.dart';
import 'package:aimart_admin/app/modules/home/model/product_color_model.dart';
import 'package:aimart_admin/app/modules/home/model/product_model.dart';
import 'package:aimart_admin/app/modules/home/model/product_size_model.dart';
import 'package:aimart_admin/app/modules/home/model/producttag.dart';
import 'package:aimart_admin/app/services/database_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class ProductController extends GetxController {
  DatabaseService db = DatabaseService();

  Future<void> addProduct({
    required String productName,
    required String productType,
    required String productDesscription,
    required ProductCategory productCategory,
    required double productPrice,
    required double oldPrice,
    required List<String> productImages,
    required Tagtype tag,
    
    // required List<ProductColor> colors,
    // required List<ProductSize> sizes,
  }) async {

    try {
      String productId = const Uuid().v4();
    Product product = Product(
      productId: productId,
      productName: productName,
      productType: productType,
      description: productDesscription,
      productPrice: productPrice,
      oldPrice: oldPrice,
      productImages: productImages,
      productCategory: productCategory,
      productTag: ProductTag(tagname: tag.toString(), tagtype: tag),
      // colors: colors,
      // sizes: sizes,
    );
    await db.productsCollection
          .doc()
          .set(
            product.toMap(),
          );

     } on FirebaseException catch (e) {
      Get.snackbar("Product Not Added", e.toString());
    }
    
  }
}
