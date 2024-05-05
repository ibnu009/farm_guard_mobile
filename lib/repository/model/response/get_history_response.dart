// To parse this JSON data, do
//
//     final getHistoryResponse = getHistoryResponseFromJson(jsonString);

import 'dart:convert';

GetHistoryResponse getHistoryResponseFromJson(String str) => GetHistoryResponse.fromJson(json.decode(str));

String getHistoryResponseToJson(GetHistoryResponse data) => json.encode(data.toJson());

class GetHistoryResponse {
  Meta meta;
  List<HistoryData> data;

  GetHistoryResponse({
    required this.meta,
    required this.data,
  });

  factory GetHistoryResponse.fromJson(Map<String, dynamic> json) => GetHistoryResponse(
    meta: Meta.fromJson(json["meta"]),
    data: List<HistoryData>.from(json["data"].map((x) => HistoryData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class HistoryData {
  String typeHealth;
  String pathImage;
  String date;

  HistoryData({
    required this.typeHealth,
    required this.pathImage,
    required this.date,
  });

  factory HistoryData.fromJson(Map<String, dynamic> json) => HistoryData(
    typeHealth: json["type_health"],
    pathImage: json["path_image"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "type_health": typeHealth,
    "path_image": pathImage,
    "date": date,
  };
}

class Meta {
  int code;
  String status;
  String message;

  Meta({
    required this.code,
    required this.status,
    required this.message,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    code: json["code"],
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
  };
}
