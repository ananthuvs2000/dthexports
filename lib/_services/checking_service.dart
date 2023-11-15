import 'package:dth/_api_endpoints/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CheckingDataService extends ChangeNotifier {
  //! API ENDPOINT
  final String _checkingAPI = '$apiHOME/itemcheck_add';

  //^ Posting a new Chcecking record
  Future<bool> postCheck(
    String venue,
    String vendor,
    String quantity,
    String teamID,
  ) async {
    //
    print({venue, vendor, quantity, teamID});
    final response = await http.post(
      Uri.parse(_checkingAPI),
      // Body
      body: {
        "vendor_code": vendor,
        "batch_code": generateBatchCode(),
        "venue": venue,
        "quantity_checked": quantity,
        "team_name": teamID,
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.body);
      throw Exception('${response.statusCode} Failed to post checking record');
    }
  }


}

String generateBatchCode() {
  final year = DateTime.now().year;
  final month = DateTime.now().month;
  final day = DateTime.now().day;
  final hour = DateTime.now().hour;
  final minute = DateTime.now().minute;
  final second = DateTime.now().second;
  final String batchCode = 'BC$year$month$day$hour$minute$second';
  print(batchCode);
  return batchCode;
}
