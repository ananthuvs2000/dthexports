import 'package:dth/_services/team_service.dart';
import 'package:dth/_models/team_model.dart';
import 'package:flutter/material.dart';

class TeamProvider with ChangeNotifier {
  List<Team> _teamList = [];

  Future<void> fetchTeams() async {
    final dataProvider = TeamDataService();
    _teamList = await dataProvider.fetchTeams();
    notifyListeners();
  }

  List<Team> get teams => _teamList;
}
