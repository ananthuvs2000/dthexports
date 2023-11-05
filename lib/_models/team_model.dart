// To parse this JSON data, do
//
//     final team = teamFromJson(jsonString);

import 'dart:convert';

List<Team> teamFromJson(String str) =>
    List<Team>.from(json.decode(str).map((x) => Team.fromJson(x)));

String teamToJson(List<Team> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Team {
  int id;
  String teamName;
  dynamic createdAt;
  dynamic updatedAt;

  Team({
    required this.id,
    required this.teamName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        teamName: json["team_name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "team_name": teamName,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
