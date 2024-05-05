// To parse this JSON data, do
//
//     final editProfileResponse = editProfileResponseFromJson(jsonString);

import 'dart:convert';

EditProfileResponse editProfileResponseFromJson(String str) => EditProfileResponse.fromJson(json.decode(str));

String editProfileResponseToJson(EditProfileResponse data) => json.encode(data.toJson());

class EditProfileResponse {
  Meta meta;
  List<dynamic> data;

  EditProfileResponse({
    required this.meta,
    required this.data,
  });

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) => EditProfileResponse(
    meta: Meta.fromJson(json["meta"]),
    data: List<dynamic>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta.toJson(),
    "data": List<dynamic>.from(data.map((x) => x)),
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
