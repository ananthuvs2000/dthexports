import 'dart:convert';
import 'package:dth/_api_endpoints/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:dth/_models/item_check_model.dart';
import 'package:flutter/material.dart';

class ItemCheckDataService extends ChangeNotifier {
  final String _checkingPendingAPI = '$apiHOME/filter_check_status';

  //^ Fetching all checked batches
  Future<List<ItemCheck>> getCheckedBatches() async {
    final response = await http.post(Uri.parse(_checkingPendingAPI), body: {
      "filter_data": "pending",
    });

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      final List<ItemCheck> mapped = jsonData
          .map(
            (item) => ItemCheck(
              id: item['id'],
              batchCode: item['batch_code'],
              venue: item['venue'],
              vendoCode: item['vendor_code'],
              quantityChecked: item['quantity_checked'],
              teamName: item['team_name'],
              status: item['status'],
            ),
          )
          .toList();

      return mapped;
    } else {
      throw Exception('Could not get item checks');
    }
  }
}
