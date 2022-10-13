import 'package:aimart_admin/app/modules/home/widgets/loading_dialog.dart';
import 'package:aimart_admin/app/services/database_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/product_model.dart';

class ProductController extends GetxController {
  DatabaseService db = DatabaseService();

  Future<void> addProduct({required Product product}) async {
    showLoadingDialog(message: 'Adding Product');
    try {
      var doc = db.productsCollection.doc();
      product.productId = doc.id;
      await db.productsCollection.doc().set(product.toMap());
      hideLoadingDialog();
    } on Exception catch (e) {
      hideLoadingDialog();
      Get.snackbar("Product Not Added", e.toString());
    }
  }
}
