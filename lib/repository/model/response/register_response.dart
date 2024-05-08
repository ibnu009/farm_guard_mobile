// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) => json.encode(data.toJson());

class RegisterResponse {
  Meta meta;
  Data data;

  RegisterResponse({
    required this.meta,
    required this.data,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
    meta: Meta.fromJson(json["meta"]),
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta.toJson(),
    "data": data.toJson(),
  };
}

class Data {
  User user;
  String token;

  Data({
    required this.user,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
  };
}

class User {
  String name = "";
  String email = "";
  String phone = "";
  DateTime birthdate = DateTime.now();
  String gender = "";
  DateTime updatedAt = DateTime.now();
  DateTime createdAt = DateTime.now();
  int id = -1;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.birthdate,
    required this.gender,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    birthdate: DateTime.parse(json["birthdate"]),
    gender: json["gender"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "birthdate": birthdate.toIso8601String(),
    "gender": gender,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
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
