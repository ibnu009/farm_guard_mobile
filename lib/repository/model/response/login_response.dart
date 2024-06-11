import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  Meta meta;
  Data? data;

  LoginResponse({
    required this.meta,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    meta: Meta.fromJson(json["meta"]),
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta.toJson(),
    "data": data?.toJson(),
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
  int id;
  String name;
  String email;
  String phone;
  DateTime? birthdate;
  String gender;
  dynamic emailVerifiedAt;
  String photo;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.birthdate,
    required this.gender,
    this.emailVerifiedAt,
    required this.photo,
     this.createdAt,
     this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    birthdate: json["birthdate"] == null ? null :  DateTime.parse(json["birthdate"]),
    gender: json["gender"],
    emailVerifiedAt: json["email_verified_at"],
    photo: json["photo"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null :  DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "birthdate": birthdate?.toIso8601String(),
    "gender": gender,
    "email_verified_at": emailVerifiedAt,
    "photo": photo,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
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

LoginErrorResponse loginErrorResponseFromJson(String str) => LoginErrorResponse.fromJson(json.decode(str));

String loginErrorResponseToJson(LoginErrorResponse data) => json.encode(data.toJson());

class LoginErrorResponse {
  Meta meta;
  dynamic data;

  LoginErrorResponse({
    required this.meta,
    required this.data,
  });

  factory LoginErrorResponse.fromJson(Map<String, dynamic> json) => LoginErrorResponse(
    meta: Meta.fromJson(json["meta"]),
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "meta": meta.toJson(),
    "data": data.toJson(),
  };
}

class ErrorData {
  String message;
  String token;

  ErrorData({
    required this.message,
    required this.token,
  });

  factory ErrorData.fromJson(Map<String, dynamic> json) => ErrorData(
    message: json["message"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "token": token,
  };
}