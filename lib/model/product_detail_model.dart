// product_detail_model.dart

class ProductDetail {
  final String id;
  final String sku;
  final String title;
  final String description;
  final Category category;
  final Vendor vendor;
  final String thumbnailImage;
  final List<ProductVariation> productVariations;

  ProductDetail({
    required this.id,
    required this.sku,
    required this.title,
    required this.description,
    required this.category,
    required this.vendor,
    required this.thumbnailImage,
    required this.productVariations,
  });
}

class Category {
  final String id;
  final String name;
  final String thumbnailImage;

  Category({
    required this.id,
    required this.name,
    required this.thumbnailImage,
  });
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      thumbnailImage: json['thumbnail_image'],
    );
  }
}

class Vendor {
  final int id;
  final String logo;
  final String shopName;
  final String shopAddress;
  final String shopCity;
  final String shopState;
  final bool isApproved;
  final double averageRating;
  final int totalReviews;

  Vendor({
    required this.id,
    required this.logo,
    required this.shopName,
    required this.shopAddress,
    required this.shopCity,
    required this.shopState,
    required this.isApproved,
    required this.averageRating,
    required this.totalReviews,
  });
  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'],
      logo: json['logo'],
      shopName: json['shop_name'],
      shopAddress: json['shop_address'],
      shopCity: json['shop_city'],
      shopState: json['shop_state'],
      isApproved: json['is_approved'],
      averageRating: json['average_rating'],
      totalReviews: json['total_reviews'],
    );
  }
}

class ProductVariation {
  final String id;
  final String price;
  final int quantity;
  final int discount;
  final List<ProductAttribute> attributes;

  ProductVariation({
    required this.id,
    required this.price,
    required this.quantity,
    required this.discount,
    required this.attributes,
  });
}

class ProductAttribute {
  final String id;
  final String value;
  final String name;

  ProductAttribute({
    required this.id,
    required this.value,
    required this.name,
  });
  factory ProductAttribute.fromJson(Map<String, dynamic> json) {
    return ProductAttribute(
      id: json['id'],
      name: json['name'],
      value: json['value'],
    );
  }
}

class Attribute {
  final String id;
  final String name;

  Attribute({
    required this.id,
    required this.name,
  });
}
