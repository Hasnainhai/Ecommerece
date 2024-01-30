import 'dart:convert';

import 'package:ecommerece/model/all_prod_model.dart';
import 'package:ecommerece/model/product_model.dart';
import 'package:ecommerece/view/Home/dashboard/Products/product_view.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  void getAllProducts() async {
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
        AllProdModel allProdModel = AllProdModel.fromJson(jsonResponse);

        // Access the data in the model
        List<AllProduct> allProducts = allProdModel.allProducts;
        List<Product> newProducts = allProdModel.newProducts.cast<Product>();
        List<Product> mostSales = allProdModel.mostSales.cast<Product>();
        List<Category> categories = allProdModel.categories;

        // Do whatever you need with the data
        print('All Products:');
        for (var product in allProducts) {
          print('Product ID: ${product.id}, Title: ${product.title}');
        }

        print('\nCategories:');
        for (var category in categories) {
          print('Category ID: ${category.id}, Name: ${category.name}');
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
