import 'package:aimart_admin/app/modules/home/widgets/loading_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:universal_html/html.dart' as html;
import 'package:get/get.dart';

class FirebaseStorageServices {
  static Future<String> uploadToStorageAsHTMLFile(
      {required html.File file, required String folderName}) async {
    showLoadingDialog(message: 'Uploading Image..');
    try {
      final Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child('$folderName/file${DateTime.now().millisecondsSinceEpoch}');
      final UploadTask uploadTask = firebaseStorageRef.putBlob(file);
      final TaskSnapshot downloadUrl = await uploadTask;
      String url = await downloadUrl.ref.getDownloadURL();
      hideLoadingDialog();
      return url;
    } on FirebaseException catch (e) {
      hideLoadingDialog();
      Get.snackbar('Error', e.toString());
      return "";
    }
  }
}
