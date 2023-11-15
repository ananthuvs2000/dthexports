import 'package:dth/_models/accepted_box_of_batch.dart';
import 'package:dth/_services/accepted_box_service.dart';
import 'package:flutter/cupertino.dart';

class AcceptedBoxesProvider with ChangeNotifier {
  late List<AcceptedBox> _acceptedBoxesForProduction = [];

  void getAcceptedBoxesForProduction(String batchCode) async {
    final dataProvider = AcceptedBoxService();
    _acceptedBoxesForProduction = await dataProvider.fetchAcceptedBoxesForProduction(batchCode);
    notifyListeners();
  }

  List<AcceptedBox> get acceptedBoxes => _acceptedBoxesForProduction;
}
