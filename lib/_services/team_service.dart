import 'dart:convert';

import 'package:dth/_api_endpoints/api_endpoints.dart';
import 'package:dth/_models/team_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TeamDataService extends ChangeNotifier {
  //! API ENDPOINT
  final String _teamAPI = '$apiHOME/team';

  Future<List<Team>> fetchTeams() async {
    final response = await http.get(Uri.parse(_teamAPI));
    print(response.body);
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
}
