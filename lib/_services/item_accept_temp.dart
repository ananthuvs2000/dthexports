import 'package:dth/_api_endpoints/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ItemAcceptTempData extends ChangeNotifier {
  //! API ENDPOINTS
  final String _uri = '$apiHOME/item_accept_temp';
  final String _uriAdd = '$apiHOME/item_accept_tmp_add';

  Future<bool> postTempData() async {
    final response = await http.post(Uri.parse(_uriAdd), body: {
      "batch_code": "B02",
      "box_ref": "2",
      "color_ref": "2",
      "size_ref": "2",
      "material_qty": "200",
      "image_path": "test",
      "process": "raw_material"
    });
    // print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to post ${response.statusCode}');
    }
  }
}
