import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:farm_guard/constants/network_constants.dart';
import 'package:farm_guard/pages/Login/otp.dart';
import 'package:farm_guard/repository/model/request/register_request.dart';
import 'package:farm_guard/repository/model/request/reset_password_request.dart';
import 'package:farm_guard/repository/model/response/edit_profile_response.dart';
import 'package:farm_guard/repository/model/response/error_response.dart';
import 'package:farm_guard/repository/model/response/login_response.dart';
import 'package:farm_guard/repository/model/response/otp_response.dart';
import 'package:farm_guard/repository/model/response/register_response.dart';
import 'package:farm_guard/utils/network/api_client.dart';

class AuthRepository extends ApiClient {
  Future<Either<LoginErrorResponse, LoginResponse>> loginUser(
      String email, String password) async {
    final response = await postMethod(
      NetworkConstants.LOGIN_URL,
      queryParameter: {"email": email, "password": password},
    );

    print("Res : $response");

    if (response['meta']['code'] == 200) {
      return Right(LoginResponse.fromJson(response));
    } else {
      return Left(LoginErrorResponse.fromJson(response));
    }
  }

  Future<Either<ErrorResponse, RegisterResponse>> registerUser(
      RegisterRequest registerRequest) async {
    final response = await postMethod(NetworkConstants.REGISTER_URL,
        queryParameter: registerRequest.toJson());

    print("Res : $response");

    if (response['meta']['code'] == 200) {
      return Right(RegisterResponse.fromJson(response));
    } else {
      return Left(ErrorResponse.fromJson(response));
    }
  }

  Future<OtpResponse> activateAccount(String token, String otpCode) async {
    final response = await postMethod(
      NetworkConstants.OTP_URL,
      queryParameter: {"otp": otpCode},
      header: {"Authorization": "Bearer $token"},
    );

    return OtpResponse.fromJson(response);
  }

  Future<EditProfileResponse> editProfile(
      String name, String birthDate, String gender, File photo) async {
    String fileName = photo.path.split('/').last;
    FormData formData = FormData.fromMap({
      "name": name,
      "birthdate": birthDate,
      "gender": gender,
      "photo": await MultipartFile.fromFile(photo.path, filename: fileName),
    });
    Dio dio = new Dio(BaseOptions(
      validateStatus: (statusCode) {
        return true;
      },
    ));
    final response =
        await dio.post(NetworkConstants.EDIT_PROFILE, data: formData);
    return EditProfileResponse.fromJson(response.data);
  }

  Future<EditProfileResponse> forgotPassword(String email) async {
    final response = await postMethod(NetworkConstants.FORGOT_PASSWORD,
        queryParameter: {"credential": email});

    return EditProfileResponse.fromJson(response);
  }

  Future<EditProfileResponse> resetPassword(
      {required String email,
      required String password,
      required String passwordConfirmation,
      required String otp}) async {
    ResetPasswordRequest resetPasswordRequest = ResetPasswordRequest(
      credential: email,
      otp: int.parse(otp),
      password: password,
      passwordConfirmation: passwordConfirmation,
    );

    final response = await postMethod(NetworkConstants.RESET_PASSWORD,
        queryParameter: resetPasswordRequest.toJson());

    print("REST: $response");

    return EditProfileResponse.fromJson(response);
  }
}
