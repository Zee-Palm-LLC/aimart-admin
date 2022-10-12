import 'package:firebase_storage/firebase_storage.dart';
import 'package:universal_html/html.dart' as html;
import 'package:get/get.dart';

class FirebaseStorageServices {
  static Future<String> uploadToStorageAsHTMLFile(
      {required html.File file, required String folderName}) async {
    try {
      final Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(
            '$folderName/file${DateTime.now().millisecondsSinceEpoch}',
          );

      final UploadTask uploadTask = firebaseStorageRef.putBlob(file);

      final TaskSnapshot downloadUrl = await uploadTask;

      String url = await downloadUrl.ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      Get.snackbar('Error', e.toString());
      return "";
    }
  }
}
