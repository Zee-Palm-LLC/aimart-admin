import 'package:aimart_admin/app/modules/home/model/algolia.dart';
import 'package:aimart_admin/app/modules/home/widgets/loading_dialog.dart';
import 'package:aimart_admin/app/services/database_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/product_model.dart';

class ProductController extends GetxController {
  DatabaseService db = DatabaseService();

  final Rx<List<Product>> _products = Rx<List<Product>>([]);
  List<Product> get products => _products.value;
   var algolia = AlgoliaApplication.algolia;

  @override
  void onInit() {
    super.onInit();
    _products.bindStream(
        db.productsCollection.snapshots().map((QuerySnapshot query) {
      List<Product> retVal = [];
      for (var element in query.docs) {
        retVal.add(Product.fromMap(element.data() as Map<String, dynamic>));
      }
      return retVal;
    }));
  }

  Future<void> addProduct({required Product product}) async {
    showLoadingDialog(message: 'Adding Product');
    try {
      var doc = db.productsCollection.doc();
      product.productId = doc.id;
      await doc.set(product.toMap());
      await algolia.instance.index('document').addObject(product.toMap());
      
      hideLoadingDialog();
    } on Exception catch (e) {
      hideLoadingDialog();
      Get.snackbar("Product Not Added", e.toString());
    }
  }

  Future<void> updateProduct({required Product product}) async {
    showLoadingDialog(message: 'Updating Product');
    try {
      await db.productsCollection
          .doc(product.productId)
          .update(product.toMap());
      await algolia.instance.index('document')
      .object(product.productId).
      updateData(product.toMap());
      Get.back();
      hideLoadingDialog();
    } on Exception catch (e) {
      hideLoadingDialog();
      Get.snackbar("Product not Update", e.toString());
    }
  }

  Future<void> deleteProduct({required Product product}) async {
    showLoadingDialog(message: 'Deleting Product');
    try {
      await db.productsCollection.doc(product.productId).delete();
       await algolia.instance
      .index('document')
      .object(product.productId)
      .deleteObject();
      hideLoadingDialog();
    } on Exception catch (e) {
      hideLoadingDialog();
      Get.snackbar("Product is not Delete", e.toString());
    }
  }
}
