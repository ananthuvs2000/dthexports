import 'package:dth/_models/production_daystart_model.dart';
import 'package:dth/_services/production_day_end_service.dart';
import 'package:flutter/cupertino.dart';

class ProductionDayEndProvider with ChangeNotifier {
  // All the fields needed in day end screen
  late List<Map<String, dynamic>> _dayEndBatchCodes = [];
  late BoxData? selectedBox;
  late double totalPercentWastage = 0.000;

  // Text Editing Controllers
  final TextEditingController weightController = TextEditingController();

  //! Functions handled by this provider
  // Function to fetch all data needed at day end by given date
  Future<List<Map<String, dynamic>>> fetchBatchCodes(String date) async {
    final dataService = ProductionDayEndInitialDataService();
    _dayEndBatchCodes = await dataService.fetchBatchCodes(date);
    notifyListeners();
    return _dayEndBatchCodes;
  }

  // Fetching all daystart data over to dayend
  Future fetchDataForDayEnd({
    required String date,
    required String batchCode,
    required String boxNum,
  }) async {
    
  }

  List<Map<String, dynamic>> get dayEndBatchCodes => _dayEndBatchCodes;
}
