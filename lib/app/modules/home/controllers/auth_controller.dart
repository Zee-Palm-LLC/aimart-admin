import 'package:aimart_admin/app/modules/home/model/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../widgets/loading_dialog.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signOut() async {
    showLoadingDialog(message: "Signing out...");
    await _auth.signOut();
    hideLoadingDialog();
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    showLoadingDialog(message: 'Signing in...');
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      hideLoadingDialog();
    } on FirebaseAuthException catch (err) {
      hideLoadingDialog();
      Get.snackbar('Error', err.message!);
    }
  }

  Future<void> addtoAlggolira({required Product product}) async {
    
  }
}
