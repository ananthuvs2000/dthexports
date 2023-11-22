import 'package:dth/_models/production_daystart_model.dart';
import 'package:dth/_services/production_day_start_service.dart';
import 'package:flutter/material.dart';

class ProductionDayStartProvider extends ChangeNotifier {
  final ProductionDayStartService _productionDayStartService = ProductionDayStartService();

  late ProductionDayStartData _dayStartData = ProductionDayStartData(boxData: [], workerdata: []);
  BoxData? _selectedBox;
  late Set<Workerdatum> _addedEmployees = {};

  Future<void> fetchDataAndUpdateState(String batchCode) async {
    try {
      _dayStartData = await _productionDayStartService.fetchDayStartData(batchCode);

      _addedEmployees = {..._dayStartData.workerdata.toSet()};
      print(_addedEmployees);
      notifyListeners();
    } catch (error) {
      // Handle errors here
      print('Error fetching data: $error');
    }
  }

  BoxData findBoxByBoxRef(String boxRef) {
    // Return the box with the matching boxRef
    final foundBox = _dayStartData.boxData.firstWhere(
      (box) => box.boxRef == boxRef,
    );
    _selectedBox = foundBox;
    notifyListeners();
    return foundBox;
  }

  void addWorker(Workerdatum worker) {
    // _dayStartData.workerdata.add(worker);
    _addedEmployees.add(worker);
    notifyListeners();
  }

  bool workerExists(Workerdatum worker) {
    print('workerExists(${worker.employeeName})');
    if (_addedEmployees.contains(worker) || _dayStartData.workerdata.contains(worker)) {
      print('Duplicate found');
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  void removeWorker(Workerdatum worker) {
    // _dayStartData.workerdata.remove(worker);
    _addedEmployees.remove(worker);
    notifyListeners();
  }

  void clearData() {
    _dayStartData = ProductionDayStartData(boxData: [], workerdata: []);
    _selectedBox = null;
    _addedEmployees.clear();
    notifyListeners();
  }

// ALL GETTERS
  ProductionDayStartData get dayStartData => _dayStartData;
  List<Workerdatum> get workerDataList => _dayStartData.workerdata;
  List<BoxData> get boxDataList => _dayStartData.boxData;
  BoxData? get selectedBox => _selectedBox;
  Set<Workerdatum> get workerAddedList => _addedEmployees;
}
