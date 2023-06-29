import 'package:flutter/foundation.dart';

class ParameterProvider extends ChangeNotifier {
  double _width = 100;
  double get width => _width;
  double _height = 100;
  double get height => _height;
  double _borderRadius = 0;
  double get borderRadius => _borderRadius;

  void heightSlider(value) {
    _height = value;
    notifyListeners();
  }

  void widthSlider(value) {
    _width = value;
    notifyListeners();
  }

  void borderRadiusSlider(value) {
    _borderRadius = value;
    notifyListeners();
  }
}
