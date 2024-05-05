import 'dart:convert';

UploadHealthRecordResponse uploadHealthRecordResponseFromJson(String str) => UploadHealthRecordResponse.fromJson(json.decode(str));

String uploadHealthRecordResponseToJson(UploadHealthRecordResponse data) => json.encode(data.toJson());

class UploadHealthRecordResponse {
  Meta meta;
  Data data;

  UploadHealthRecordResponse({
    required this.meta,
    required this.data,
  });

  factory UploadHealthRecordResponse.fromJson(Map<String, dynamic> json) => UploadHealthRecordResponse(
    meta: Meta.fromJson(json["meta"]),
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta.toJson(),
    "data": data.toJson(),
  };
}

class Data {
  String pathImage;

  Data({
    required this.pathImage,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    pathImage: json["path_image"],
  );

  Map<String, dynamic> toJson() => {
    "path_image": pathImage,
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
