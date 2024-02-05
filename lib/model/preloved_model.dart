class PrelovedProduct {
  final String id;
  final String sku;
  final String title;
  final Category category;
  final String slug;
  final int quantity;
  final String thumbnailImage;
  final String price;
  final int discount;
  final String? promotional;
  final int totalReviews;
  final int averageReview;

  PrelovedProduct({
    required this.id,
    required this.sku,
    required this.title,
    required this.category,
    required this.slug,
    required this.quantity,
    required this.thumbnailImage,
    required this.price,
    required this.discount,
    required this.promotional,
    required this.totalReviews,
    required this.averageReview,
  });

  factory PrelovedProduct.fromJson(Map<String, dynamic> json) {
    return PrelovedProduct(
      id: json['id'],
      sku: json['sku'],
      title: json['title'],
      category: Category.fromJson(json['category']),
      slug: json['slug'] ?? "",
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
      bannerImage: json['banner_image'] ?? "",
    );
  }
}
