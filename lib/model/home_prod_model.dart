// To parse this JSON data, do
//
//     final homeProdModel = homeProdModelFromJson(jsonString);

import 'dart:convert';

HomeProdModel homeProdModelFromJson(String str) =>
    HomeProdModel.fromJson(json.decode(str));

String homeProdModelToJson(HomeProdModel data) => json.encode(data.toJson());

class HomeProdModel {
  List<Category> productCategories;
  List<Products> productsNew;
  List<Products> productsFeature;
  List<Products> productsTopOrder;
  List<Products> productsTopRated;
  List<Products> productsTopDiscount;

  HomeProdModel({
    required this.productCategories,
    required this.productsNew,
    required this.productsFeature,
    required this.productsTopOrder,
    required this.productsTopRated,
    required this.productsTopDiscount,
  });

  factory HomeProdModel.fromJson(Map<String, dynamic> json) => HomeProdModel(
        productCategories: List<Category>.from(
            json["product_categories"].map((x) => Category.fromJson(x))),
        productsNew: List<Products>.from(
            json["products_new"].map((x) => Products.fromJson(x))),
        productsFeature: List<Products>.from(
            json["products_feature"].map((x) => Products.fromJson(x))),
        productsTopOrder: List<Products>.from(
            json["products_top_order"].map((x) => Products.fromJson(x))),
        productsTopRated: List<Products>.from(
            json["products_top_rated"].map((x) => Products.fromJson(x))),
        productsTopDiscount: List<Products>.from(
            json["products_top_discount"].map((x) => Products.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product_categories":
            List<dynamic>.from(productCategories.map((x) => x.toJson())),
        "products_new": List<dynamic>.from(productsNew.map((x) => x.toJson())),
        "products_feature":
            List<dynamic>.from(productsFeature.map((x) => x.toJson())),
        "products_top_order":
            List<dynamic>.from(productsTopOrder.map((x) => x.toJson())),
        "products_top_rated":
            List<dynamic>.from(productsTopRated.map((x) => x.toJson())),
        "products_top_discount":
            List<dynamic>.from(productsTopDiscount.map((x) => x.toJson())),
      };
}

class Category {
  String id;
  String name;
  String thumbnailImage;
  dynamic bannerImage;

  Category({
    required this.id,
    required this.name,
    required this.thumbnailImage,
    required this.bannerImage,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        thumbnailImage: json["thumbnail_image"],
        bannerImage: json["banner_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "thumbnail_image": thumbnailImage,
        "banner_image": bannerImage,
      };
}

class Products {
  String id;
  String sku;
  String title;
  Category category;
  String slug;
  String thumbnailImage;
  String price;
  int discount;
  dynamic promotional;
  int totalReviews;
  int averageReview;
  Vendor vendor;

  Products({
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

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        sku: json["sku"],
        title: json["title"],
        category: Category.fromJson(json["category"]),
        slug: json["slug"],
        thumbnailImage: json["thumbnail_image"],
        price: json["price"],
        discount: json["discount"],
        promotional: json["promotional"],
        totalReviews: json["total_reviews"],
        averageReview: json["average_review"],
        vendor: Vendor.fromJson(json["vendor"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sku": sku,
        "title": title,
        "category": category.toJson(),
        "slug": slug,
        "thumbnail_image": thumbnailImage,
        "price": price,
        "discount": discount,
        "promotional": promotional,
        "total_reviews": totalReviews,
        "average_review": averageReview,
        "vendor": vendor.toJson(),
      };
}

class Vendor {
  int id;
  String username;
  String email;
  VendorDetails vendorDetails;

  Vendor({
    required this.id,
    required this.username,
    required this.email,
    required this.vendorDetails,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        vendorDetails: VendorDetails.fromJson(json["vendor_details"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "vendor_details": vendorDetails.toJson(),
      };
}

class VendorDetails {
  int id;
  String shopName;
  dynamic tagline;

  VendorDetails({
    required this.id,
    required this.shopName,
    required this.tagline,
  });

  factory VendorDetails.fromJson(Map<String, dynamic> json) => VendorDetails(
        id: json["id"],
        shopName: json["shop_name"],
        tagline: json["tagline"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_name": shopName,
        "tagline": tagline,
      };
}
