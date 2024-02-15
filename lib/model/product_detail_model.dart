class Product {
  String id;
  String sku;
  String title;
  String description;
  double price;
  List<String> images;
  double discount;
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
      id: json['id'],
      sku: json['sku'],
      title: json['title'],
      description: json['description'],
      price: double.parse(json['price']),
      images: List<String>.from(json['images']),
      discount: double.parse(json['discount']),
      vendor: Vendor.fromJson(json['vendor']),
      productVariations: List<ProductVariation>.from(json['product_variations']
          .map((variation) => ProductVariation.fromJson(variation))),
    );
  }
}

class Vendor {
  int id;
  String shopName;
  // Add other vendor fields as needed

  Vendor({
    required this.id,
    required this.shopName,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'],
      shopName: json['shop_name'],
      // Add other vendor fields as needed
    );
  }
}

class ProductVariation {
  String id;
  String product;
  List<Attribute> attributes;
  double price;
  int quantity;
  double discount;
  // Add other variation fields as needed

  ProductVariation({
    required this.id,
    required this.product,
    required this.attributes,
    required this.price,
    required this.quantity,
    required this.discount,
  });

  factory ProductVariation.fromJson(Map<String, dynamic> json) {
    return ProductVariation(
      id: json['id'],
      product: json['product'],
      attributes: List<Attribute>.from(
          json['attributes'].map((attribute) => Attribute.fromJson(attribute))),
      price: double.parse(json['price']),
      quantity: json['quantity'],
      discount: double.parse(json['discount']),
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
      id: json['id'],
      attribute: AttributeDetail.fromJson(json['attribute']),
    );
  }
}

class AttributeDetail {
  String id;
  String name;
  String value; // Add this line for the attribute value

  AttributeDetail({
    required this.id,
    required this.name,
    required this.value,
  });

  factory AttributeDetail.fromJson(Map<String, dynamic> json) {
    return AttributeDetail(
      id: json['id'],
      name: json['name'],
      value: json['value'], // Add this line to get the attribute value
    );
  }
}
