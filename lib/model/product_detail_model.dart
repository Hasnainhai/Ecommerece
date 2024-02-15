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
  final Attribute attribute;
  final String value;

  ProductAttribute({
    required this.id,
    required this.attribute,
    required this.value,
  });
}

class Attribute {
  final String id;
  final String name;

  Attribute({
    required this.id,
    required this.name,
  });
}
