// To parse this JSON data, do
//
//     final productionDayStartData = productionDayStartDataFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

ProductionDayStartData productionDayStartDataFromJson(String str) =>
    ProductionDayStartData.fromJson(json.decode(str));

String productionDayStartDataToJson(ProductionDayStartData data) => json.encode(data.toJson());

class ProductionDayStartData {
  List<BoxData> boxData;
  List<WorkerData> workerdata;

  ProductionDayStartData({
    required this.boxData,
    required this.workerdata,
  });

  factory ProductionDayStartData.fromJson(Map<String, dynamic> json) => ProductionDayStartData(
        boxData: List<BoxData>.from(json["box_data"].map((x) => BoxData.fromJson(x))),
        workerdata: List<WorkerData>.from(json["workerdata"].map((x) => WorkerData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "box_data": List<dynamic>.from(boxData.map((x) => x.toJson())),
        "workerdata": List<dynamic>.from(workerdata.map((x) => x.toJson())),
      };
}

class BoxData {
  int id;
  String batchCode;
  String boxRef;
  String sizeRef;
  String colorRef;
  String textureRef;
  String materialQty;
  String imagePath;
  String process;
  DateTime createdAt;
  DateTime updatedAt;

  BoxData({
    required this.id,
    required this.batchCode,
    required this.boxRef,
    required this.sizeRef,
    required this.colorRef,
    required this.textureRef,
    required this.materialQty,
    required this.imagePath,
    required this.process,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BoxData.fromJson(Map<String, dynamic> json) => BoxData(
        id: json["id"],
        batchCode: json["batch_code"],
        boxRef: json["box_ref"],
        sizeRef: json["size_ref"],
        colorRef: json["color_ref"],
        textureRef: json["texture_ref"],
        materialQty: json["material_qty"],
        imagePath: json["image_path"],
        process: json["process"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "batch_code": batchCode,
        "box_ref": boxRef,
        "size_ref": sizeRef,
        "color_ref": colorRef,
        "texture_ref": textureRef,
        "material_qty": materialQty,
        "image_path": imagePath,
        "process": process,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class WorkerData extends Equatable {
  // final int id;
  final String name;
  final String empCode;
  final DateTime createdAt;
  // final DateTime updatedAt;

  const WorkerData({
    // required this.id,
    required this.name,
    required this.empCode,
    required this.createdAt,
    // required this.updatedAt,
  });

  @override
  List<Object?> get props => [empCode, name];

  factory WorkerData.fromJson(Map<String, dynamic> json) => WorkerData(
        // id: json["id"],
        name: json["employee_name"],
        empCode: json["employee_code"],
        createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "employee_name": name,
        "employee_code": empCode,
        "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
      };
}
