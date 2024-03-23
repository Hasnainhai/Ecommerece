class ProductShop {
  final String id;
  final String sku;
  final String title;
  final Category category;
  final int quantity;
  final String thumbnailImage;
  final String price;
  final int discount;
  final dynamic promotional;
  final int totalReviews;
  final int averageReview;

  ProductShop({
    required this.id,
    required this.sku,
    required this.title,
    required this.category,
    required this.quantity,
    required this.thumbnailImage,
    required this.price,
    required this.discount,
    required this.promotional,
    required this.totalReviews,
    required this.averageReview,
  });

  factory ProductShop.fromJson(Map<String, dynamic> json) {
    return ProductShop(
      id: json['id'],
      sku: json['sku'],
      title: json['title'],
      category: Category.fromJson(json['category']),
      quantity: json['quantity'],
      thumbnailImage: json['thumbnail_image'],
      price: json['price'],
      discount: json['discount'],
      promotional: json['promotional'],
      totalReviews: json['total_reviews'],
      averageReview: json['average_review'],
    );
  }
}

class Category {
  final String id;
  final String name;
  final String thumbnailImage;
  final String? bannerImage;

  Category({
    required this.id,
    required this.name,
    required this.thumbnailImage,
    this.bannerImage,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      thumbnailImage: json['thumbnail_image'],
      bannerImage: json['banner_image'],
    );
  }
}
