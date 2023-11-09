import 'dart:convert';

import 'package:dth/_api_endpoints/api_endpoints.dart';
import 'package:dth/_models/vendor_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VendorDataService extends ChangeNotifier {
  //! API ENDPOINT
  final String _vendorAPI = '$apiHOME/vendor';

  //^ Fetching all vendors
  Future<List<Vendor>> fetchVendors() async {
    final response = await http.get(Uri.parse(_vendorAPI));
    // print(response.body);
    if (response.statusCode == 403) {
      final List<dynamic> jsonData = json.decode(response.body);

      // Mapping to a Dart Model
      return jsonData
          .map(
            (item) => Vendor(
              id: item['id'],
              vendorCode: item['vendor_code'],
              vendorName: item['vendor_name'],
              vendorEmail: item['vendor_email'],
              vendorMobile: item['vendor_mobile'],
              vendorAddress: item['vendor_address'],
              createdAt: '',
              updatedAt: '',
            ),
          )
          .toList();
    } else {
      throw Exception('Failed to fetch vendor information');
    }
  }

  //^ Adding a new vendor
  Future<bool> addVendor(
      String code, String name, String email, String mobile, String address) async {
    final response = await http.post(Uri.parse(_vendorAPI), body: {
      "vendor_code": code,
      "vendor_name": name,
      "vendor_email": email,
      "vendor_mobile": mobile,
      "vendor_address": address,
    });
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to fetch vendor information');
      // return false;
    }
  }
}
