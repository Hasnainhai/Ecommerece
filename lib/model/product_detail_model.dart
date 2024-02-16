import 'dart:convert';

class Product {
  String id;
  String sku;
  String title;
  String description;
  dynamic price; // Change the type to dynamic
  List<String> images;
  dynamic discount; // Change the type to dynamic
  Vendor vendor;
  List<ProductVariation> productVariations;

  Product({
    required this.id,
    required this.sku,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.discount,
    required this.vendor,
    required this.productVariations,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      sku: json['sku'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price'], // No need to parse here
      images: List<String>.from(json['images'] ?? []),
      discount: json['discount'], // No need to parse here
      vendor: Vendor.fromJson(json['vendor'] ?? {}),
      productVariations: List<ProductVariation>.from(
        (json['product_variations'] as List<dynamic>? ?? [])
            .map((variation) => ProductVariation.fromJson(variation)),
      ),
    );
  }
}

class Vendor {
  int id;
  String shopName;

  Vendor({
    required this.id,
    required this.shopName,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'] ?? 0,
      shopName: json['shop_name'] ?? '',
    );
  }
}

class ProductVariation {
  String id;
  String product;
  List<Attribute> attributes;
  dynamic price; // Change the type to dynamic
  dynamic discount; // Change the type to dynamic

  ProductVariation({
    required this.id,
    required this.product,
    required this.attributes,
    required this.price,
    required this.discount,
  });

  factory ProductVariation.fromJson(Map<String, dynamic> json) {
    return ProductVariation(
      id: json['id'] ?? '',
      product: json['product'] ?? '',
      attributes: List<Attribute>.from(
        (json['attributes'] as List<dynamic>? ?? [])
            .map((attribute) => Attribute.fromJson(attribute)),
      ),
      price: json['price'], // No need to parse here
      discount: json['discount'], // No need to parse here
    );
  }
}

class Attribute {
  String id;
  AttributeDetail attribute;

  Attribute({
    required this.id,
    required this.attribute,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      id: json['id'] ?? '',
      attribute: AttributeDetail.fromJson(json['attribute'] ?? {}),
    );
  }
}

class AttributeDetail {
  String id;
  String name;
  String value;

  AttributeDetail({
    required this.id,
    required this.name,
    required this.value,
  });

  factory AttributeDetail.fromJson(Map<String, dynamic> json) {
    return AttributeDetail(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      value: json['value'] ?? '',
    );
  }
}
