import 'package:dth/_models/production_daystart_model.dart';
import 'package:dth/_services/production_day_start_service.dart';
import 'package:flutter/material.dart';

class ProductionDayStartProvider extends ChangeNotifier {
  final ProductionDayStartService _productionDayStartService = ProductionDayStartService();

  late ProductionDayStartData _dayStartData = ProductionDayStartData(boxData: [], workerdata: []);
  BoxDatum? _selectedBox;

  List<BoxDatum> get boxDataList => _dayStartData.boxData;

  List<Workerdatum> get workerDataList => _dayStartData.workerdata;

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

  void clearData() {
    _dayStartData = ProductionDayStartData(boxData: [], workerdata: []);
    _selectedBox = null;
    notifyListeners();
  }

  ProductionDayStartData get dayStartData => _dayStartData;
  BoxDatum? get selectedBox => _selectedBox;
}
