class HomeProdModel {
  List<Category> productCategories;
  List<TopShop> topShops;
  List<Products> productsNew;
  List<Products> productsFeature;
  List<Products> productsTopOrder;
  List<Products> productsTopRated;
  List<Products> productsTopDiscount;

  HomeProdModel({
    required this.productCategories,
    required this.topShops,
    required this.productsNew,
    required this.productsFeature,
    required this.productsTopOrder,
    required this.productsTopRated,
    required this.productsTopDiscount,
  });

  factory HomeProdModel.fromJson(Map<String, dynamic> json) {
    return HomeProdModel(
      productCategories: List<Category>.from(
        json['product_categories']
            .map((category) => Category.fromJson(category)),
      ),
      topShops: List<TopShop>.from(
        json['top_shops'].map((shop) => TopShop.fromJson(shop)),
      ),
      productsNew: List<Products>.from(
        json['products_new'].map((product) => Products.fromJson(product)),
      ),
      productsFeature: List<Products>.from(
        json['products_feature'].map((product) => Products.fromJson(product)),
      ),
      productsTopOrder: List<Products>.from(
        json['products_top_order'].map((product) => Products.fromJson(product)),
      ),
      productsTopRated: List<Products>.from(
        json['products_top_rated'].map((product) => Products.fromJson(product)),
      ),
      productsTopDiscount: List<Products>.from(
        json['products_top_discount']
            .map((product) => Products.fromJson(product)),
      ),
    );
  }
}

class Category {
  String id;
  String name;
  String thumbnailImage;
  String? bannerImage;

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

class TopShop {
  int id;
  String logo;
  String? coverImage;
  String shopName;
  String? tagline;
  String shopAddress;
  String? shopPostalCode;
  String shopCity;
  String shopState;
  String? shopCountry;
  bool isApproved;
  double averageRating;
  int totalReviews;

  TopShop({
    required this.id,
    required this.logo,
    this.coverImage,
    required this.shopName,
    this.tagline,
    required this.shopAddress,
    this.shopPostalCode,
    required this.shopCity,
    required this.shopState,
    this.shopCountry,
    required this.isApproved,
    required this.averageRating,
    required this.totalReviews,
  });

  factory TopShop.fromJson(Map<String, dynamic> json) {
    return TopShop(
      id: json['id'],
      logo: json['logo'],
      coverImage: json['cover_image'],
      shopName: json['shop_name'],
      tagline: json['tagline'],
      shopAddress: json['shop_address'],
      shopPostalCode: json['shop_postal_code'],
      shopCity: json['shop_city'],
      shopState: json['shop_state'],
      shopCountry: json['shop_country'],
      isApproved: json['is_approved'],
      averageRating: json['average_rating'],
      totalReviews: json['total_reviews'],
    );
  }
}

class Products {
  final String id;
  final String title;
  final Category category; // Assuming you have a Category class
  final String thumbnailImage;
  final double price;
  final int discount;
  final int totalReviews;
  final int averageReview;

  Products({
    required this.id,
    required this.title,
    required this.category,
    required this.thumbnailImage,
    required this.price,
    required this.discount,
    required this.totalReviews,
    required this.averageReview,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      title: json['title'],
      category: Category.fromJson(json['category']),
      thumbnailImage: json['thumbnail_image'],
      price: double.parse(json['price']),
      discount: json['discount'],
      totalReviews: json['total_reviews'],
      averageReview: json['average_review'],
    );
  }
}
