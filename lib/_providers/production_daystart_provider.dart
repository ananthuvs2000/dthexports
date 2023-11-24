import 'package:dth/_models/production_daystart_model.dart';
import 'package:dth/_services/production_day_start_service.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class ProductionDayStartProvider extends ChangeNotifier {
  final ProductionDayStartService _productionDayStartService = ProductionDayStartService();

  late ProductionDayStartData _dayStartData = ProductionDayStartData(boxData: [], workerdata: []);
  BoxData? _selectedBox;
  late Set<WorkerData> _addedEmployees = {};

  TextEditingController weightController = TextEditingController();
  double finalWeight = 0.000;

  //

  void calculateMaterialWeight(String? value) {
    if (value != null && double.parse(value) > 2.7) {
      finalWeight = (double.parse(value.toString()) - 02.700).toPrecision(3);
      notifyListeners();
    }
  }

  Future<void> fetchDataAndUpdateState(String batchCode) async {
    try {
      _dayStartData = await _productionDayStartService.fetchDayStartData(batchCode);

      _addedEmployees = {..._dayStartData.workerdata.toSet()};
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

  void addWorker(WorkerData worker) {
    // _dayStartData.workerdata.add(worker);
    _addedEmployees.add(worker);
    notifyListeners();
  }

  bool workerExists(WorkerData worker) {
    if (_addedEmployees.contains(worker)) {
      print('Duplicate found');
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  void removeWorker(WorkerData worker) {
    // _dayStartData.workerdata.remove(worker);
    _addedEmployees.remove(worker);
    notifyListeners();
  }

  void clearData() {
    _dayStartData = ProductionDayStartData(boxData: [], workerdata: []);
    _selectedBox = null;
    _addedEmployees.clear();
    weightController.clear();
    finalWeight = 0.000;
    notifyListeners();
  }

// ALL GETTERS
  ProductionDayStartData get dayStartData => _dayStartData;
  List<BoxData> get boxDataList => _dayStartData.boxData;
  BoxData? get selectedBox => _selectedBox;
  Set<WorkerData> get addedEmployees => _addedEmployees;
}
