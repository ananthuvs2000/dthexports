import 'package:flutter/material.dart';

class AcceptPageDropDownProvider with ChangeNotifier {
  // Initial Values
  String _box = '';
  String _size = '';
  String _color = '';
  String _texture = '';

  set updateBoxNumber(String value) {
    _box = value;
    notifyListeners();
  }

  set updateSize(String value) {
    _size = value;
    notifyListeners();
  }

  set updateColor(String value) {
    _color = value;
    notifyListeners();
  }

  set updateTexture(String value) {
    _color = value;
    notifyListeners();
  }

  void clearDropdowns() {
    _size = '';
    _color = '';
    _texture = '';
  }

  String get size => _size;
  String get color => _color;
  String get texture => _texture;
  String get box => _box;
}
