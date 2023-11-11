import 'dart:async';
import 'package:dth/_models/item_check_model.dart';
import 'package:dth/_services/itemcheck_service.dart';
import 'package:flutter/material.dart';

class ItemCheckProvider with ChangeNotifier {
  late List<ItemCheck> _itemCheckController = [];

  Future<List<ItemCheck>> getItemChecks() async {
    final dataProvider = ItemCheckDataService();
    _itemCheckController = await dataProvider.getCheckedBatches();
    notifyListeners();
    return _itemCheckController;
  }

  List<ItemCheck> get itemCheckStream => _itemCheckController;
}
