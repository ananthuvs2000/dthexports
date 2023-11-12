import 'dart:async';
import 'package:dth/_services/item_accept_temp_service.dart';
import 'package:flutter/material.dart';

class ItemAcceptTempProvider with ChangeNotifier {
  late List<int> _boxesRemaining = [];

  Future<List<int>> getItemChecks(String batchCode) async {
    final dataProvider = ItemAcceptTempService();
    _boxesRemaining = await dataProvider.getRemainingBoxNums(batchCode);
    notifyListeners();
    return _boxesRemaining;
  }

  List<int> get boxesRemaining => _boxesRemaining;
}
