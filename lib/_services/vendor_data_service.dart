import 'dart:convert';

import 'package:dth/_api/api_constant.dart';
import 'package:dth/models/vendor_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VendorDataService extends ChangeNotifier {
  //! API ENDPOINT
  final String vendorAPI = '$apiURL/vendor';

  Future<List<Vendor>> fetchVendors() async {
    final response = await http.get(Uri.parse(vendorAPI));
    print(response.body);
    if (response.statusCode == 403) {
      final List<dynamic> jsonData = json.decode(response.body);

      // Mapping to a Dart Model
      return jsonData
          .map(
            (item) => Vendor(
              id: item['id'],
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
}
