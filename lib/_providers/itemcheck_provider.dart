import 'dart:async';
import 'package:dth/_models/item_check_model.dart';
import 'package:dth/_services/itemcheck_service.dart';
import 'package:flutter/material.dart';

class ItemCheckProvider with ChangeNotifier {
  late List<ItemCheck> _itemCheckController = [];

  List<ItemCheck> get itemCheckStream => _itemCheckController;

  Future<List<ItemCheck>> getItemChecks() async {
    final dataProvider = ItemCheckDataService();
    _itemCheckController = await dataProvider.getPendingBatches();

    notifyListeners();
    return _itemCheckController;
  }

  // Dispose of the stream controller when the provider is no longer needed
  void dispose() {
    _itemCheckController.clear();
  }
}
