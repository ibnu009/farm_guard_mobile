// To parse this JSON data, do
//
//     final getProfileResponse = getProfileResponseFromJson(jsonString);

import 'dart:convert';

GetProfileResponse getProfileResponseFromJson(String str) =>
    GetProfileResponse.fromJson(json.decode(str));

String getProfileResponseToJson(GetProfileResponse data) =>
    json.encode(data.toJson());

class GetProfileResponse {
  int id;
  String name;
  String email;
  String phone;
  DateTime birthdate;
  String gender;
  String photo;

  GetProfileResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.birthdate,
    required this.gender,
    required this.photo,
  });

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) =>
      GetProfileResponse(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        birthdate: DateTime.parse(json["birthdate"]),
        gender: json["gender"],
        photo: json["photo"] == null ? '' : json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "birthdate": birthdate.toIso8601String(),
        "gender": gender,
        "photo": photo,
      };
}
