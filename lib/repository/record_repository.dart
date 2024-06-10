import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:farm_guard/constants/network_constants.dart';
import 'package:farm_guard/repository/model/response/error_response.dart';
import 'package:farm_guard/repository/model/response/get_history_response.dart';
import 'package:farm_guard/repository/model/response/upload_health_record_response.dart';
import 'package:farm_guard/utils/network/api_client.dart';
import 'package:farm_guard/utils/preferences/app_preferences.dart';

class RecordRepository extends ApiClient {
  Future<Either<ErrorResponse, GetHistoryResponse>> getRecordHistory() async {
    final response = await get(NetworkConstants.RECORD_HISTORY_URL);

    print("Res : $response");

    if (response['meta']['code'] == 200) {
      return Right(GetHistoryResponse.fromJson(response));
    } else {
      return Left(ErrorResponse.fromJson(response));
    }
  }

  Future<Either<ErrorResponse, UploadHealthRecordResponse>>
      uploadHealthRecordResponse(String typeHealth, File file, String accuracy) async {
    Dio dio = new Dio(BaseOptions(
      validateStatus: (statusCode) {
        if (statusCode == null) {
          return false;
        }
        if (statusCode == 422) {
          // your http status code
          return true;
        } else if (statusCode == 401) {
          return true;
        } else if (statusCode == 404) {
          return true;
        } else if (statusCode == 302) {
          return true;
        } else if (statusCode == 503) {
          return true;
        }else {
          return statusCode >= 200 && statusCode < 300;
        }
      },
    ));

    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "path_image": await MultipartFile.fromFile(file.path, filename: fileName),
      "type_health": typeHealth,
      "accuration": accuracy
    });

    print("DATA IS: \n" + formData.fields.toString());

    var token = await AppPreferences().readSecureData(AppPreferences().token);
    final response = await dio.post(
      NetworkConstants.UPLOAD_IMAGE_HEALTH_RECORD,
      data: formData,
      options: Options(
        headers: {
          'Authorization': 'Bearer ${token}',
        },
      ),
    );

    print(response.requestOptions.path);

    print(response.data);

    if (response.data['meta']['code'] == 200) {
      return Right(UploadHealthRecordResponse.fromJson(response.data));
    } else {
      return Left(ErrorResponse.fromJson(response.data));
    }
  }
}
