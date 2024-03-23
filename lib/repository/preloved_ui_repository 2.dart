import 'package:ecommerece/res/preloved_enums.dart';
import 'package:flutter/material.dart';

class PrelovedUiRepository extends ChangeNotifier {
  PrelovedUiType _selectedType = PrelovedUiType.DefaultSection;

  PrelovedUiType get selectedType => _selectedType;

  void switchToType(PrelovedUiType type) {
    _selectedType = type;
    notifyListeners();
  }
}
