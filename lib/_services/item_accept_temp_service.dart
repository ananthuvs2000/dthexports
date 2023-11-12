import 'package:dth/_api_endpoints/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ItemAcceptTempService extends ChangeNotifier {
  //! API ENDPOINTS
  final String _uriAdd = '$apiHOME/item_accept_tmp_add';
  final String _uriGetRemainingBoxNums = '$apiHOME/item_accept_tmp';

  Future<List<int>> getRemainingBoxNums(String batchCode) async {
    final result = http.post(
      Uri.parse(_uriGetRemainingBoxNums),
      body: {'batch_code': batchCode},
    );

    return [];
  }

  Future<bool> postTempData({
    required String batchCode,
    required String boxRef,
    required String colorRef,
    required String sizeRef,
    required String materialQty,
    required String imagePath,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse(_uriAdd));

    // Add text fields
    request.fields['batch_code'] = batchCode;
    request.fields['box_ref'] = boxRef;
    request.fields['color_ref'] = colorRef;
    request.fields['size_ref'] = sizeRef;
    request.fields['material_qty'] = materialQty;
    request.fields['image_path'] = imagePath;
    request.fields['process'] = 'raw_material';

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        // Successful response
        return true;
      } else {
        // Handle other status codes
        print('Failed to post ${response.statusCode}');
        return false;
      }
    } catch (error) {
      // Handle errors during the request
      print('Error during POST request: $error');
      return false;
    }
  }
}
