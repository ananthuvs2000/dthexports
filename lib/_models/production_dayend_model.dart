// To parse this JSON data, do
//
//     final productionDayStartFilterData = productionDayStartFilterDataFromJson(jsonString);

import 'dart:convert';

List<ProductionDayEndInitialData> productionDayStartFilterDataFromJson(String str) =>
    List<ProductionDayEndInitialData>.from(
        json.decode(str).map((x) => ProductionDayEndInitialData.fromJson(x)));

String productionDayStartFilterDataToJson(List<ProductionDayEndInitialData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductionDayEndInitialData {
  int id;
  DateTime dayStartDate;
  String batchCode;
  String boxno;
  String process;
  String team;
  String image;
  String weightShown;
  String calculatedWeight;
  DateTime createdAt;
  DateTime updatedAt;

  ProductionDayEndInitialData({
    required this.id,
    required this.dayStartDate,
    required this.batchCode,
    required this.boxno,
    required this.process,
    required this.team,
    required this.image,
    required this.weightShown,
    required this.calculatedWeight,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductionDayEndInitialData.fromJson(Map<String, dynamic> json) =>
      ProductionDayEndInitialData(
        id: json["id"],
        dayStartDate: DateTime.parse(json["day_start_date"]),
        batchCode: json["batch_code"],
        boxno: json["boxno"],
        process: json["process"],
        team: json["team"],
        image: json["image"],
        weightShown: json["weight_shown"],
        calculatedWeight: json["calculated_weight"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "day_start_date":
            "${dayStartDate.year.toString().padLeft(4, '0')}-${dayStartDate.month.toString().padLeft(2, '0')}-${dayStartDate.day.toString().padLeft(2, '0')}",
        "batch_code": batchCode,
        "boxno": boxno,
        "process": process,
        "team": team,
        "image": image,
        "weight_shown": weightShown,
        "calculated_weight": calculatedWeight,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
