import 'package:ecommerece/model/all_prod_model.dart';
import 'package:ecommerece/model/vendor_model.dart';

class Product {
  final String id;
  final String sku;
  final String title;
  final Category category;
  final String slug;
  final String thumbnailImage;
  final String price;
  final int discount;
  final dynamic promotional; // Adjust the type as needed
  final int totalReviews;
  final int averageReview;
  final Vendor vendor;

  Product({
    required this.id,
    required this.sku,
    required this.title,
    required this.category,
    required this.slug,
    required this.thumbnailImage,
    required this.price,
    required this.discount,
    required this.promotional,
    required this.totalReviews,
    required this.averageReview,
    required this.vendor,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      sku: json['sku'] as String,
      title: json['title'] as String,
      category: Category.fromJson(json['category']),
      slug: json['slug'] as String,
      thumbnailImage: json['thumbnail_image'] as String,
      price: json['price'] as String,
      discount: json['discount'] as int,
      promotional: json['promotional'],
      totalReviews: json['total_reviews'] as int,
      averageReview: json['average_review'] as int,
      vendor: Vendor.fromJson(json['vendor']),
    );
  }
}
