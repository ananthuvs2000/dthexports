import 'dart:convert';
import 'package:dth/_api_endpoints/api_endpoints.dart';
import 'package:dth/_models/accepted_box_of_batch.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ItemAcceptTempService extends ChangeNotifier {
  //! API ENDPOINTS
  final String _uriAdd = '$apiHOME/item_accept_tmp_add';
  final String _uriGetAcceptedBoxesOfBatch = '$apiHOME/item_accept_tmp';
  final String _uriDeleteOneAcceptedBox = '$apiHOME/item_accept_tmp_remove';
  final String _uriGetRemainingBoxNums = '$apiHOME/get_batchcode_available_boxes';
  final String _uriAcceptFinalize = '$apiHOME/accept_tmp_store_confirm';

  Future<List<dynamic>> getRemainingBoxNums(String batchCode) async {
    try {
      final response = await http.post(
        Uri.parse(_uriGetRemainingBoxNums),
        body: {'batch_code': batchCode},
      );

      if (response.statusCode == 200) {
        final List<dynamic> result = jsonDecode(response.body);
        final list = result.map((e) => e).toList();
        return list;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> postTempData({
    required String batchCode,
    required String boxRef,
    required String colorRef,
    required String sizeRef,
    required String textureRef,
    required String materialQty,
    required String imagePath,
  }) async {
    try {
      final response = await http.post(Uri.parse(_uriAdd), body: {
        // Add text fields
        'batch_code': batchCode,
        'box_ref': boxRef,
        'size_ref': sizeRef,
        'color_ref': colorRef,
        'texture_ref': textureRef,
        'material_qty': materialQty,
        'image_path': imagePath,
        'process': 'raw_material',
      });

      if (response.statusCode == 200) {
        // Successful response
        return true;
      }
    } catch (e) {
      throw Exception('Error $e');
    }
    return false;
  }

  // Getting all temp added box info of that batch
  Future<List<AcceptedBox>> getAcceptedBoxes(String batchCode) async {
    final response = await http.post(
      Uri.parse(_uriGetAcceptedBoxesOfBatch),
      body: {'batch_code': batchCode},
    );
    // print(response.body);

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      final List<AcceptedBox> list = result
          .map(
            (item) => AcceptedBox(
              boxRef: item['box_ref'],
              colorRef: item['color_ref'],
              sizeRef: item['size_ref'],
              textureRef: item['texture_ref'],
              materialQty: item['material_qty'],
            ),
          )
          .toList();

      return list;
    } else {
      throw Exception('Failed to get temp box info');
    }
  }

  // Removing one box from accepted temp list
  Future<bool> deleteBoxFromAccepted(
    String batchCode,
    String boxNumber,
  ) async {
    final response = await http.post(
      Uri.parse(_uriDeleteOneAcceptedBox),
      body: {
        'batch_code': batchCode,
        'box_ref': boxNumber,
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to get temp box info');
    }
  }

  //^ FINALIZE ACCEPT PROCESS OF A BATCH
  Future<bool> finalizeBatchAccept(String batchCode) async {
    final response = await http.post(
      Uri.parse(_uriAcceptFinalize),
      body: {'batch_code': batchCode},
    );
    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to get temp box info');
    }
  }
}
