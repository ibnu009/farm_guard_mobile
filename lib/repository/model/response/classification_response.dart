import 'dart:convert';

ClassificationResponse classificationResponseFromJson(String str) =>
    ClassificationResponse.fromJson(json.decode(str));

String classificationResponseToJson(ClassificationResponse data) =>
    json.encode(data.toJson());

class ClassificationResponse {
  String message;
  String assumption;
  String note;
  String akurasi;

  ClassificationResponse(
      {required this.message,
      required this.assumption,
      required this.note,
      required this.akurasi});

  factory ClassificationResponse.fromJson(Map<String, dynamic> json) =>
      ClassificationResponse(
          message: json["message"],
          assumption: json["assumption"],
          note: json["note"],
          akurasi: json["akurasi"]);

  Map<String, dynamic> toJson() => {
        "message": message,
        "assumption": assumption,
        "note": note,
        "akurasi": akurasi
      };
}
