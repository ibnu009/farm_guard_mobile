import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:farm_guard/utils/preferences/app_preferences.dart';

Dio dio = new Dio(BaseOptions(
  validateStatus: (statusCode) {
    if (statusCode == null) {
      return false;
    }
    if (statusCode == 422) {
      // your http status code
      return true;
    }
    else if (statusCode == 400) {
      return true;
    } else if (statusCode == 401) {
      return true;
    } else if (statusCode == 403) {
      return true;
    } else if (statusCode == 500) {
      return true;
    } else {
      return statusCode >= 200 && statusCode < 300;
    }
  },
));

abstract class ApiClient {
  Future<dynamic> get(
    String endpoint, {
    Map<String, String>? queryParameter,
  }) async {
    try {
      var option = await getHeader();
      Response response = await dio.get(
        options: option,
        endpoint,
        queryParameters: queryParameter,
      );

      final rawResponse = jsonDecode(response.toString());
      return rawResponse;
    } on SocketException {
      throw Exception("Connection failed");
    }
  }

  Future<dynamic> postMethod(
    String endpoint, {
    Map<String, dynamic>? queryParameter,
    Map<String, String>? header,
  }) async {
    try {
      Response response = await dio.post(endpoint,
          queryParameters: queryParameter, options: Options(headers: header));

      final rawResponse = jsonDecode(response.toString());
      return rawResponse;
    } on SocketException {
      throw Exception("Connection failed");
    } on FormatException catch (e) {
      print("Format exception ${e.message.toString()}");
    }
  }

  Future<dynamic> postMethodWithBody(
    String endpoint, {
    Map<String, String>? bodyRequest,
    Map<String, String>? header,
  }) async {
    try {
      Response response = await dio.post(
        endpoint,
        data: bodyRequest,
        options: Options(
          headers: header,
        ),
      );
      final rawResponse = jsonDecode(response.toString());
      return rawResponse;
    } on SocketException {
      throw Exception("Connection failed");
    } on FormatException catch (e) {
      print("Format exception ${e.message.toString()}");
    }
  }

  Future<Options> getHeader() async {
    var token = await AppPreferences().readSecureData(AppPreferences().token);
    Options option = Options(
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer ${token}',
      },
      receiveDataWhenStatusError: true,
    );
    return option;
  }
}
