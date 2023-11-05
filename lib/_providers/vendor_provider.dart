import 'package:dth/_services/vendor_service.dart';
import 'package:dth/_models/vendor_model.dart';
import 'package:flutter/material.dart';

class VendorProvider with ChangeNotifier {
  List<Vendor> _vendorsList = [];

  Future<List<DropdownMenuEntry>> fetchVendors() async {
    final dataProvider = VendorDataService();
    _vendorsList = await dataProvider.fetchVendors();

    final entries = convertVendorsListToDropdownEntries(_vendorsList);
    notifyListeners();
    return entries;
  }

  List<Vendor> get vendors => _vendorsList;

  List<DropdownMenuEntry> convertVendorsListToDropdownEntries(List<Vendor> vendors) {
    List<DropdownMenuEntry> entryList = [];
    for (final vendor in vendors) {
      entryList.add(
        DropdownMenuEntry(
          value: vendor.vendorName.toString(),
          label: vendor.vendorName.toString(),
        ),
      );
    }
    return entryList;
  }
}
