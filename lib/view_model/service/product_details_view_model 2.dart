import 'package:ecommerece/repository/product_detail_repository.dart';
import 'package:flutter/material.dart';

class ProductDetailsRepositoryProvider extends ChangeNotifier {
  final ProductDetailsRepository _productDetailsRepository =
      ProductDetailsRepository();

  ProductDetailsRepository get productDetailsRepository =>
      _productDetailsRepository;

  Future<void> fetchProductDetails(
      BuildContext context, String productId) async {
    await _productDetailsRepository.fetchProductDetails(context, productId);
    notifyListeners();
  }
}
