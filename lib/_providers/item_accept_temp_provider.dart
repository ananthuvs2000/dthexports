import 'dart:async';
import 'package:dth/_models/accepted_box_of_batch.dart';
import 'package:dth/_services/item_accept_temp_service.dart';
import 'package:flutter/material.dart';

class ItemAcceptTempProvider with ChangeNotifier {
  late List<dynamic> _boxesRemaining = [];
  late List<AcceptedBox> _acceptedBoxesOfBatch = [];
  late bool _resultAcceptedBoxDeletion;

  Future<List<dynamic>> getRemainingBoxes(String batchCode) async {
    final dataProvider = ItemAcceptTempService();
    _boxesRemaining = await dataProvider.getRemainingBoxNums(batchCode);
    notifyListeners();
    return _boxesRemaining;
  }

  Future<List<AcceptedBox>> getAcceptedBoxes(String batchCode) async {
    final dataProvider = ItemAcceptTempService();
    _acceptedBoxesOfBatch = await dataProvider.getAcceptedBoxes(batchCode);
    notifyListeners();
    return _acceptedBoxesOfBatch;
  }

  Future<bool> deleteOneAcceptedBox(String batchCode, String boxRef) async {
    final dataProvider = ItemAcceptTempService();
    _resultAcceptedBoxDeletion = await dataProvider.deleteBoxFromAccepted(batchCode, boxRef);
    notifyListeners();
    return _resultAcceptedBoxDeletion;
  }

  List<dynamic> get boxesRemaining => _boxesRemaining;
  List<AcceptedBox> get acceptedBoxes => _acceptedBoxesOfBatch;
  bool get boxDeleteResult => _resultAcceptedBoxDeletion;
}
