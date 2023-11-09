import 'dart:convert';

List<Vendor> vendorFromJson(String str) =>
    List<Vendor>.from(json.decode(str).map((x) => Vendor.fromJson(x)));

String vendorToJson(List<Vendor> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Vendor {
  int id;
  String vendorName;
  String vendorCode;
  String vendorEmail;
  String vendorMobile;
  String vendorAddress;
  dynamic createdAt;
  dynamic updatedAt;

  Vendor({
    required this.id,
    required this.vendorCode,
    required this.vendorName,
    required this.vendorEmail,
    required this.vendorMobile,
    required this.vendorAddress,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["id"],
        vendorCode: json["vendor_code"],
        vendorName: json["vendor_name"],
        vendorEmail: json["vendor_email"],
        vendorMobile: json["vendor_mobile"],
        vendorAddress: json["vendor_address"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_code": vendorCode,
        "vendor_name": vendorName,
        "vendor_email": vendorEmail,
        "vendor_mobile": vendorMobile,
        "vendor_address": vendorAddress,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
