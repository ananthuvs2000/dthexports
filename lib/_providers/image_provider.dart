import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraProvider with ChangeNotifier {
  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  XFile? get image => _image;

  Future<void> getImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
    );

    if (image != null) {
      _setImage(image);
      notifyListeners();
    }
  }

  void _setImage(XFile image) {
    _image = image;
  }

  void clearImage() {
    _image = null;
    notifyListeners();
  }
}
