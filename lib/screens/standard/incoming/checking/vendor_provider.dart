import 'package:dth/_services/vendor_data_service.dart';
import 'package:dth/models/vendor_model.dart';
import 'package:flutter/foundation.dart';

class VendorProvider with ChangeNotifier {
  List<Vendor> _vendorsList = [];

  List<Vendor> get vendors => _vendorsList;

  Future<void> loadPosts() async {
    final dataProvider = VendorDataService();
    _vendorsList = await dataProvider.fetchVendors();
    notifyListeners();
  }
}
