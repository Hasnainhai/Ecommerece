import 'package:ecommerece/res/enums.dart';
import 'package:flutter/material.dart';

class HomeUiSwithchRepository extends ChangeNotifier {
  UIType _selectedType = UIType.DefaultSection;

  UIType get selectedType => _selectedType;

  void switchToType(UIType type) {
    _selectedType = type;
    notifyListeners();
  }
}
