import 'package:ecommerece/model/vendor_detail_model.dart';

class Vendor {
  final int id;
  final String username;
  final String email;
  final VendorDetails vendorDetails;

  Vendor({
    required this.id,
    required this.username,
    required this.email,
    required this.vendorDetails,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
      vendorDetails: VendorDetails.fromJson(json['vendor_details']),
    );
  }
}
