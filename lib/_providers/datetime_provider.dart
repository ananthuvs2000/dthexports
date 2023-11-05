import 'package:dth/_services/datetime_service.dart';
import 'package:dth/_models/datetime_model.dart';
import 'package:flutter/material.dart';

class DateTimeProvider with ChangeNotifier {
  DateAndTime _dateTime = {} as DateAndTime;

  Future<DateAndTime> fetchDateTime() async {
    final dataProvider = DateTimeService();
    _dateTime = await dataProvider.fetchDateTime();
    notifyListeners();
    return _dateTime;
  }

  DateAndTime get vendors => _dateTime;
}
