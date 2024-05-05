import 'dart:convert';

ClassificationResponse classificationResponseFromJson(String str) =>
    ClassificationResponse.fromJson(json.decode(str));

String classificationResponseToJson(ClassificationResponse data) =>
    json.encode(data.toJson());

class ClassificationResponse {
  String message;
  String assumption;

  ClassificationResponse({
    required this.message,
    required this.assumption,
  });

  factory ClassificationResponse.fromJson(Map<String, dynamic> json) =>
      ClassificationResponse(
        message: json["message"],
        assumption: json["assumption"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "assumption": assumption,
      };
}
