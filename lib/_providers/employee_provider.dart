import 'package:dth/_models/production_daystart_model.dart';
import 'package:dth/_services/employee_service.dart';
import 'package:flutter/material.dart';

class WorkerProvider with ChangeNotifier {
  /* List to store fetched employees after converting
  into it's dart model (done in the service) */
  List<Workerdatum> _workers = [];

  // Fetching all employees
  Future<void> fetchWorkers() async {
    final dataProvider = WorkerDataService();
    _workers = await dataProvider.fetchEmployees();
    notifyListeners();
  }

  List<Workerdatum> get workersList => _workers;
}
