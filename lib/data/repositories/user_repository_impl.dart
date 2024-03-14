// ignore_for_file: nullable_type_in_catch_clause, deprecated_member_use, unused_local_variable
import 'package:counting_love_day/data/datasource/apis/dio_client.dart';
import 'package:dio/dio.dart';

import '../../app/configs/api_config.dart';
import '../../app/core/internet_services.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  Map<String, String>? headers = {
    'Content-Type': 'application/x-www-form-urlencoded'
  };

  @override
  Future<dynamic> userLogin(
      {required String email, required String password}) async {
    try {
      final response = await DioClient.instance.post(
        login,
        data: {
          'email': email,
          'password': password,
        },
        options: Options(headers: headers),
      );
      return response;
    } on DioError catch (e) {
      var error = ApiException.fromDioError(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<dynamic> userRegister({
    required String email,
    required String userName,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await DioClient.instance.post(
        register,
        data: {
          'email': email,
          'name': userName,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
        options: Options(headers: headers),
      );
      return response;
    } on DioError catch (e) {
      var error = ApiException.fromDioError(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<dynamic> checkEmail({required String email}) async {
    try {
      final response = await DioClient.instance.post(
        checkMail,
        data: {
          'email': email,
        },
        options: Options(headers: headers),
      );
      return response;
    } on DioError catch (e) {
      var error = ApiException.fromDioError(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<dynamic> verifyUserEmail(
      {required String email, required String code}) async {
    try {
      final response = await DioClient.instance.post(
        verifyEmail,
        data: {'email': email, 'code': code},
        options: Options(headers: headers),
      );
      return response;
    } on DioError catch (e) {
      var error = ApiException.fromDioError(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<void> resendOtp({required String email}) async {
    try {
      final response = await DioClient.instance.post(
        resendOTP,
        data: {'email': email},
        options: Options(headers: headers),
      );
      return response;
    } on DioError catch (e) {
      var error = ApiException.fromDioError(e);
      throw error.errorMessage;
    }
  }
}
