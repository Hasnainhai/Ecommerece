import 'dart:convert';

import 'package:ecommerece/model/home_prod_model.dart';
import 'package:ecommerece/view/Home/dashboard/Products/product_view.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  void getHomeProd() async {
    // API endpoint
    const String apiUrl = 'http://zarozar.exarth.com/web/api/home/';
    try {
      // Make GET request
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'accept': 'application/json',
          'X-CSRFToken':
              'DFiCNJXA3vA5lHpCC8FIAhPpG0jorfK2aW1TPklEDwT7BQRgErHFicyis1k927u6',
        },
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse JSON response
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        // Create an instance of AllProdModel using the generated method
        HomeProdModel homeProdModel = HomeProdModel.fromJson(jsonResponse);

        // Access the data in the model
        List<Category> productCategories = homeProdModel.productCategories;
        List<Product> newProducts = homeProdModel.productsNew.cast<Product>();
        List<Product> productsFeature =
            homeProdModel.productsFeature.cast<Product>();
        List<Products> productsTopDiscount = homeProdModel.productsTopDiscount;
        List<Products> productsTopOrder = homeProdModel.productsTopOrder;
        List<Products> productsTopRated = homeProdModel.productsTopRated;

        // Do whatever you need with the data
        print('All Products:');
        for (var product in productsTopDiscount) {
          print('Product ID: ${product.id}, Title: ${product.title}');
        }

        print('\nCategories:');
        for (var category in productCategories) {
          print('Category ID: ${category.id}, Name: ${category.name}');
        }
        for (var product in productsFeature) {
          print('Product ID: ${product.key}');
        }

        print('\nproductsFeature:');
        for (var product in productsTopOrder) {
          print('Category ID: ${product.id}, Name: ${product.title}');
        }
        for (var product in newProducts) {
          print('Product ID: ${product.key}');
        }

        print('\nCategories:');
        for (var product in productsTopRated) {
          print('Category ID: ${product.id}, Name: ${product.title}');
        }
      } else {
        // Handle non-successful response
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      print('Exception: $e');
    }
  }
}
