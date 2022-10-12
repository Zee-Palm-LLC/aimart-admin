import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:universal_html/html.dart' as html;

class ImagePickerServices {
  static final picker = ImagePicker();

  static Future<html.File?> getImageAsFile() async {
    html.File? bytesFromPicker = await ImagePickerWeb.getImageAsFile();
    if (bytesFromPicker != null) {
      return bytesFromPicker;
    } else {
      return null;
    }
  }
}
