import 'dart:convert';

import 'package:dth/_api/api_constant.dart';
import 'package:dth/models/datetime_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DateTimeService extends ChangeNotifier {
  //! API ENDPOINT
  final String dateTimeAPI = '$apiURL/getdatetime';

  Future<DateAndTime> fetchDateTime() async {
    final response = await http.get(Uri.parse(dateTimeAPI));
    //print(response.body);
    if (response.statusCode == 403) {
      final Map<dynamic, dynamic> jsonData = json.decode(response.body);

      // Mapping to a Dart Model
      return DateAndTime(
        date: jsonData['data']['date'],
        time: jsonData['data']['time'],
      );
    } else {
      throw Exception('Failed to date time information');
    }
  }
}
