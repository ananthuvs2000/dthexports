import 'dart:convert';
import 'package:dth/_api_endpoints/api_endpoints.dart';
import 'package:http/http.dart' as http;

class ProductionDayEndInitialDataService {
  // Fetching boxes posted from day start by it's posted date
  Future<List<Map<String, dynamic>>> fetchBatchCodes(String date) async {
    const apiUrl = '$apiHOME/daystart_filter_by_date';
    final requestBody = {
      'type': 'batchcode',
      'date': date,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(requestBody),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);

        final List<Map<String, dynamic>> result = responseData.map((e) {
          return {'batch_code': e['batch_code']};
        }).toList();

        return result;
      } else {
        // Handle errors here
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network errors
      throw Exception('Error: $error');
    }
  }
}
