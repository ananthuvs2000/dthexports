import 'dart:convert';

import 'package:dth/_api_endpoints/api_endpoints.dart';
import 'package:dth/_models/accepted_box_of_batch.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AcceptedBoxService extends ChangeNotifier {
  //! API ENDPOINT
  final String _acceptedBoxesAPI = '$apiHOME/itemcheck_add';
  // All accepted boxes of batch
  Future<List<AcceptedBox>> fetchAcceptedBoxesForProduction(String batchCode) async {
    //
    final response = await http.post(
      Uri.parse(_acceptedBoxesAPI),
      // Body
      body: {
        "batch_code": batchCode,
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      return result
          .map(
            (res) => AcceptedBox(
              boxRef: res['box_ref'],
              colorRef: res['color_ref'],
              sizeRef: res['size_ref'],
              textureRef: res['texture_ref'],
              materialQty: res['material_qty'],
            ),
          )
          .toList();
    } else {
      print(response.body);
      throw Exception('${response.statusCode} Failed to post checking record');
    }
  }
}
