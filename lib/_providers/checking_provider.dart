import 'package:dth/_models/production_daystart_model.dart';
import 'package:dth/_services/checking_service.dart';
import 'package:flutter/material.dart';

class CheckingProvider with ChangeNotifier {
  // storing selected employees temporarily
  final Set<Workerdatum> _selectedEmployees = {};

  // Function to add an employee into the list
  void addEmployee(Workerdatum e) {
    _selectedEmployees.add(e);
    notifyListeners();
  }

  bool _postResult = false;
  // Posting to checking collection
  Future<bool> postToCheck(
    String venue,
    String vendor,
    String quantity,
    String teamHash,
  ) async {
    final checkingProvider = CheckingDataService();
    _postResult = await checkingProvider.postCheck(
      venue,
      vendor,
      quantity,
      teamHash,
    );
    if (_postResult) notifyListeners();
    return _postResult;
  }

  void removeSelectedEmployee(Workerdatum e) {
    _selectedEmployees.remove(e);
    notifyListeners();
  }

  void clearEmployees() {
    _selectedEmployees.clear();
    notifyListeners();
  }

  Set<Workerdatum> get addedEmpoyees => _selectedEmployees;
}
