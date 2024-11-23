import 'package:flutter/material.dart';

class ColorsSizesNotifier with ChangeNotifier {
  String _colors = '';
  String _sizes = '';
  String get sizes => _sizes;
  void setsizes(String s) {
    if (_sizes == s) {
      _sizes = '';
    } else {
      _sizes = s;
    }

    notifyListeners();
  }

  String get colors => _colors;
  void setcolors(String c) {
    if (_colors== c) {
      _colors = '';
    } else {
      _colors = c;
    }
       notifyListeners();
  }
  
}
