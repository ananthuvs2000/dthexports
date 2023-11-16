import 'dart:convert';
import 'package:dth/_api_endpoints/api_endpoints.dart';
import 'package:dth/_models/production_dayend_model.dart';
import 'package:http/http.dart' as http;

class DayStartFilterByDateService {
  Future<List<ProductionDayStartFilterData>> fetchData(String date) async {
    const apiUrl = '$apiHOME/daystart_filter_by_date';
    final requestBody = {'date': date};

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(requestBody),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);

        // Convert the response data to a list of ProductionDayStartFilterData objects
        final List<ProductionDayStartFilterData> filterDataList =
            responseData.map((item) => ProductionDayStartFilterData.fromJson(item)).toList();

        return filterDataList;
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
