import 'package:ecommerece/model/home_prod_model.dart';
import 'package:ecommerece/repository/new_items_repository.dart';
import 'package:flutter/material.dart';

class NewItemsViewModel extends ChangeNotifier {
  NewItemsRepository _newItemsRepository = NewItemsRepository();

  NewItemsRepository get homeRepository => _newItemsRepository;
  Future<void> searchAndFetchData(String query, List<Products> product) async {
    _newItemsRepository.searchNewItems(product, query);
  }
}
