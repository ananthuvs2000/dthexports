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
    print({venue, vendor, quantity, teamID});
    final response = await http.post(
      Uri.parse(_checkingAPI),
      // Body
      body: {
        "vendor_code": "V103",
        "batch_code": "BC03",
        "venue": "In-House",
        "quantity_checked": quantity,
        "team_name": "Team3"
      },
    );
    // print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to post checking record');
    }
  }
}
