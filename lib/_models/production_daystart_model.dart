// To parse this JSON data, do
//
//     final productionDayStartData = productionDayStartDataFromJson(jsonString);

import 'dart:convert';

ProductionDayStartData productionDayStartDataFromJson(String str) =>
    ProductionDayStartData.fromJson(json.decode(str));

String productionDayStartDataToJson(ProductionDayStartData data) => json.encode(data.toJson());

class ProductionDayStartData {
  List<BoxData> boxData;
  List<Workerdatum> workerdata;

  ProductionDayStartData({
    required this.boxData,
    required this.workerdata,
  });

  factory ProductionDayStartData.fromJson(Map<String, dynamic> json) => ProductionDayStartData(
        boxData: List<BoxData>.from(json["box_data"].map((x) => BoxData.fromJson(x))),
        workerdata: List<Workerdatum>.from(json["workerdata"].map((x) => Workerdatum.fromJson(x))),
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

class Workerdatum {
  int id;
  String employeeName;
  String employeeCode;
  DateTime createdAt;
  DateTime updatedAt;

  Workerdatum({
    required this.id,
    required this.employeeName,
    required this.employeeCode,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Workerdatum.fromJson(Map<String, dynamic> json) => Workerdatum(
        id: json["id"],
        employeeName: json["employee_name"],
        employeeCode: json["employee_code"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "employee_name": employeeName,
        "employee_code": employeeCode,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
