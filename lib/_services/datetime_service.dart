import 'dart:convert';
import 'package:dth/_api_endpoints/api_endpoints.dart';
import 'package:dth/_models/datetime_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DateTimeService extends ChangeNotifier {
  //! API ENDPOINT
  final String _dateTimeAPI = '$apiHOME/getdatetime';

  Future<DateAndTime> fetchDateTime() async {
    final response = await http.get(Uri.parse(_dateTimeAPI));
    //print(response.body);
    if (response.statusCode == 403) {
      final Map<String, dynamic> jsonData = json.decode(response.body);

      // Mapping to a Dart Model
      return DateAndTime(
        date: jsonData['date'],
        time: jsonData['time'],
      );
    } else {
      throw Exception('Failed to date time information');
    }
  }
}
