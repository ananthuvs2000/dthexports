import 'package:dth/_services/team_service.dart';
import 'package:dth/_models/team_model.dart';
import 'package:flutter/material.dart';

//^ Change this to employee provider
class TeamProvider with ChangeNotifier {
  List<Team> _teamList = [];

  Future<void> fetchTeams() async {
    final dataProvider = TeamDataService();
    _teamList = await dataProvider.fetchTeams();
    notifyListeners();
  }

  Future<bool> postToTeam(String hash) async {
    final dataProvider = TeamDataService();
    final res = await dataProvider.teamAdd(hash);
    if (res) {
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  List<Team> get teams => _teamList;
}
