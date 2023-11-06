import 'package:dth/_services/checking_service.dart';
import 'package:flutter/material.dart';

class CheckingProvider with ChangeNotifier {
  bool _postResult = false;

  Future<bool> postToCheck(
    String venue,
    String vendor,
    String quantity,
    String team,
  ) async {
    final checkingProvider = CheckingDataService();
    _postResult = await checkingProvider.postCheck(
      venue,
      vendor,
      quantity,
      team,
    );

    return _postResult;
  }
}
