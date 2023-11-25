import 'package:dth/_models/production_daystart_model.dart';
import 'package:dth/_services/production_day_end_service.dart';
import 'package:flutter/cupertino.dart';

class ProductionDayEndProvider with ChangeNotifier {
  // All the fields needed in day end screen
  late List<Map<String, dynamic>> _dayEndBatchCodes = [];
  late BoxData? selectedBox;

  //! Functions handled by this provider
  // Function to fetch all data needed at day end by given date
  Future<List<Map<String, dynamic>>> fetchBatchCodes(String date) async {
    final dataService = ProductionDayEndInitialDataService();
    _dayEndBatchCodes = await dataService.fetchBatchCodes(date);
    notifyListeners();
    return _dayEndBatchCodes;
  }

  // Fetching all daystart data over to dayend
  Future fetchDataForDayEnd() async {}

  // Text Editing Controllers
  final TextEditingController weightController = TextEditingController();
  late List<TextEditingController> textEditingControllers = [];

  // WorkersList
  late List<WorkerData> workersList = [];

  // Calculations
  late double enteredWeight = 0.000;
  late List<double> individualWastages = [];
  double totalWastage = 0.000;
  double totalWastageFound = 0.000;

  double totalQtyUsed = 0.000;
  double totalOutput = 0.000;

  void getEnteredWeight(String value) {
    double newVal = double.parse(value.trim());
    if (newVal > 0) enteredWeight = newVal;
  }

  void calculateIndividualWastage(
    double quantityUsed,
    double output,
  ) {}
  void calculateTotalWastage() {}

  List<Map<String, dynamic>> get dayEndBatchCodes => _dayEndBatchCodes;
}
