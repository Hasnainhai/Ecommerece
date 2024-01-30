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
      id: json['id'] as String,
      name: json['name'] as String,
      thumbnailImage: json['thumbnail_image'] as String,
      bannerImage: json['banner_image'] as String?,
    );
  }
}
