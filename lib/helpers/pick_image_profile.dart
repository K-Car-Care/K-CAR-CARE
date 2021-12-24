// ignore_for_file: avoid_print

import 'package:image_picker/image_picker.dart';

class ImagePickerProfile {
  XFile? imageFile;
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> getImage(XFile? imagepickerImage) async {
    imagepickerImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    imageFile = imagepickerImage;
    print(imageFile);
  }
}
