import 'dart:convert';

import 'package:dth/_api_endpoints/api_endpoints.dart';
import 'package:dth/_models/team_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TeamDataService extends ChangeNotifier {
  //! API ENDPOINTS
  final String _teamAPI = '$apiHOME/team';
  final String _teamAddAPI = '$apiHOME/team_add';

  Future<List<Team>> fetchTeams() async {
    final response = await http.get(Uri.parse(_teamAPI));
    // print(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);

      // Mapping to a Dart Model
      return jsonData
          .map(
            (item) => Team(
              id: item['id'],
              teamName: item['team_name'],
              createdAt: '',
              updatedAt: '',
            ),
          )
          .toList();
    } else {
      throw Exception('Failed to fetch vendor information');
    }
  }

  //
  Future<bool> teamAdd(String teamHash) async {
    final response = await http.post(Uri.parse(_teamAddAPI), body: {
      "team_name": teamHash,
    });
    // print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to fetch vendor information');
    }
  }
}
