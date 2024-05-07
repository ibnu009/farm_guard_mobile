// To parse this JSON data, do
//
//     final errorResponse = errorResponseFromJson(jsonString);

import 'dart:convert';

AuthErrorResponse errorResponseFromJson(String str) => AuthErrorResponse.fromJson(json.decode(str));

String errorResponseToJson(AuthErrorResponse data) => json.encode(data.toJson());

class AuthErrorResponse {
  Meta meta;
  ErrorData data;

  AuthErrorResponse({
    required this.meta,
    required this.data,
  });

  factory AuthErrorResponse.fromJson(Map<String, dynamic> json) => AuthErrorResponse(
    meta: Meta.fromJson(json["meta"]),
    data: ErrorData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta.toJson(),
    "data": data.toJson(),
  };
}

class ErrorData {
  List<String> email;
  List<String> phone;

  ErrorData({
    required this.email,
    required this.phone,
  });

  factory ErrorData.fromJson(Map<String, dynamic> json) => ErrorData(
    email: List<String>.from(json["email"].map((x) => x)),
    phone: List<String>.from(json["phone"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "email": List<dynamic>.from(email.map((x) => x)),
    "phone": List<dynamic>.from(phone.map((x) => x)),
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
