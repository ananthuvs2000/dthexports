import 'dart:convert';
import 'package:dth/_api_endpoints/api_endpoints.dart';
import 'package:dth/_models/datetime_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DateTimeService extends ChangeNotifier {
  //! API ENDPOINT
  final String _dateTimeAPI = '$apiHOME/getdatetime';

  Future fetchDateTime() async {
    final response = await http.get(Uri.parse(_dateTimeAPI));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      // Mapping to a Dart Model
      final apiRes = ApiResponse.fromJson(jsonData);
      final data = apiRes.data;
      return DateAndTime(
        date: data.date,
        time: data.time,
      );
    } else {
      throw Exception('Failed to get date time information');
    }
  }
}
