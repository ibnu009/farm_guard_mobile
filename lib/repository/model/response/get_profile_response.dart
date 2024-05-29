// To parse this JSON data, do
//
//     final getProfileResponse = getProfileResponseFromJson(jsonString);

import 'dart:convert';

GetProfileResponse getProfileResponseFromJson(String str) => GetProfileResponse.fromJson(json.decode(str));

String getProfileResponseToJson(GetProfileResponse data) => json.encode(data.toJson());

class GetProfileResponse {
  int id;
  String name;
  String email;
  String phone;
  DateTime birthdate;
  String gender;
  DateTime? emailVerifiedAt;
  String photo;
  DateTime createdAt;
  DateTime updatedAt;

  GetProfileResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.birthdate,
    required this.gender,
    required this.emailVerifiedAt,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) => GetProfileResponse(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    birthdate: DateTime.parse(json["birthdate"]),
    gender: json["gender"],
    emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
    photo: json["photo"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "birthdate": birthdate.toIso8601String(),
    "gender": gender,
    "photo": photo,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
