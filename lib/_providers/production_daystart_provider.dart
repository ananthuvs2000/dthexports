import 'package:dth/_models/production_daystart_model.dart';
import 'package:dth/_services/production_day_start_service.dart';
import 'package:flutter/material.dart';

class ProductionDayStartProvider extends ChangeNotifier {
  final ProductionDayStartService _productionDayStartService = ProductionDayStartService();

  late ProductionDayStartData _dayStartData = ProductionDayStartData(boxData: [], workerdata: []);
  BoxDatum? _selectedBox;

  Future<void> fetchDataAndUpdateState(String batchCode) async {
    try {
      _dayStartData = await _productionDayStartService.fetchDayStartData(batchCode);
      notifyListeners();
    } catch (error) {
      // Handle errors here
      print('Error fetching data: $error');
    }
  }

  BoxDatum findBoxByBoxRef(String boxRef) {
    // Return the box with the matching boxRef
    final foundBox = _dayStartData.boxData.firstWhere(
      (box) => box.boxRef == boxRef,
    );
    _selectedBox = foundBox;
    notifyListeners();
    return foundBox;
  }

  void addWorker(Workerdatum worker) {
    _dayStartData.workerdata.add(worker);
    notifyListeners();
  }

  bool workerExists(Workerdatum worker) {
    if (_dayStartData.workerdata.contains(worker)) {
      print('duplicate found');
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  void removeWorker(Workerdatum worker) {
    _dayStartData.workerdata.remove(worker);
    notifyListeners();
  }

  void clearData() {
    _dayStartData = ProductionDayStartData(boxData: [], workerdata: []);
    _selectedBox = null;
    notifyListeners();
  }

// ALL GETTERS
  ProductionDayStartData get dayStartData => _dayStartData;
  List<Workerdatum> get workerDataList => _dayStartData.workerdata;
  List<BoxDatum> get boxDataList => _dayStartData.boxData;
  BoxDatum? get selectedBox => _selectedBox;
}