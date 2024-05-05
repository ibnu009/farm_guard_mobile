import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:farm_guard/constants/network_constants.dart';
import 'package:farm_guard/repository/model/response/classification_response.dart';
import 'package:farm_guard/repository/model/response/error_response.dart';
import 'package:farm_guard/utils/network/api_client.dart';
import 'package:farm_guard/utils/preferences/app_preferences.dart';

class ClassificationRepository extends ApiClient {

  Future<Either<ErrorResponse, ClassificationResponse>> classifiyingImage(
      File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    });

    Dio dio = new Dio(
        BaseOptions(
          validateStatus: (statusCode){
            if(statusCode == null){
              return false;
            }
            if(statusCode == 422){ // your http status code
              return true;
            } else if (statusCode == 401) {
              return true;
            } else if (statusCode == 307) {
              return true;
            } else if (statusCode == 404) {
              return true;
            } else{
              return statusCode >= 200 && statusCode < 300;
            }
          },
        )
    );

    var token = await AppPreferences().readSecureData(AppPreferences().token);
    final response = await dio.post(NetworkConstants.CLASSIFICATION_URL,
        data: formData, options: Options(
          headers: {
            "Authorization" : "Bearer $token"
          }
        ));
    print(response.data);
    if (response.data["message"] == "Berhasil") {
      return Right(ClassificationResponse.fromJson(response.data));
    } else {
      return Left(ErrorResponse(
          meta: Meta(code: 500, message: "Gagal", status: "Gagal"), data: []));
    }
  }

}
