import 'package:flutter/material.dart';

class AcceptPageDropDownProvider with ChangeNotifier {
  // Initial Values
  String _size = '';
  String _color = '';
  String _texture = '';

  void updateSize(String value) {
    _size = value;
    notifyListeners();
  }

  void updateColor(String value) {
    _color = value;
    notifyListeners();
  }

  void updateTexture(String value) {
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
}
