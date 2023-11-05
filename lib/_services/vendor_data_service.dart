import 'dart:convert';

import 'package:dth/api/api_constant.dart';
import 'package:dth/models/vendor_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VendorDataService extends ChangeNotifier {
  final List<Vendor> vendorCodes = [];

  final String vendorCodesAPI = '$apiURL/vendors';

  Future<List<Vendor>> fetchVendors() async {
    final response = await http.post(Uri.parse(vendorCodesAPI));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData
          .map((item) => Vendor(vendorID: item['id'], vendorName: item['name']))
          .toList();
    } else {
      throw Exception('Failed to fetch vendor information');
    }
  }
}
