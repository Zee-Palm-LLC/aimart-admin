import 'package:aimart_admin/app/modules/home/controllers/product_controller.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<ProductController>(() => ProductController());
  }
}
