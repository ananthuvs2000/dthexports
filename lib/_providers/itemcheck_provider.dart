import 'dart:async';
import 'package:dth/_models/item_check_model.dart';
import 'package:dth/_services/itemcheck_service.dart';
import 'package:flutter/material.dart';

class ItemCheckProvider with ChangeNotifier {
  late List<ItemCheck> _itemCheckController = [];
  List<ItemCheck> _acceptedChecks = [];

  Future<List<ItemCheck>> getItemChecks() async {
    final dataProvider = ItemCheckDataService();
    _itemCheckController = await dataProvider.getCheckedBatches();
    notifyListeners();
    return _itemCheckController;
  }
  Future<List<ItemCheck>> fetchAcceptedChecks()async{
     final checkingProvider = ItemCheckDataService();
     _acceptedChecks = await checkingProvider.getAcceptedCheck();
     return _acceptedChecks;

  }

  List<ItemCheck> get itemCheckStream => _itemCheckController;
  List<ItemCheck> get acceptedChecks => _acceptedChecks;

}
