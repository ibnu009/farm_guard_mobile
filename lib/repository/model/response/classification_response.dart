import 'dart:convert';

ClassificationResponse classificationResponseFromJson(String str) =>
    ClassificationResponse.fromJson(json.decode(str));

String classificationResponseToJson(ClassificationResponse data) =>
    json.encode(data.toJson());

class ClassificationResponse {
  String message;
  String assumption;
  String note;

  ClassificationResponse({
    required this.message,
    required this.assumption,
    required this.note,
  });

  factory ClassificationResponse.fromJson(Map<String, dynamic> json) =>
      ClassificationResponse(
        message: json["message"],
        assumption: json["assumption"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "assumption": assumption,
        "note": note,
      };
}
