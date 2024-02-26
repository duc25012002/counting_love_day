// ignore_for_file: nullable_type_in_catch_clause, deprecated_member_use, unused_local_variable
import 'package:dio/dio.dart';
import 'package:counting_love_day/data/datasource/apis/dio_client.dart';
import '../../app/configs/api_config.dart';
import '../../app/core/internet_services.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
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
        options: Options(
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}),
      );
      return response;
    } on DioError catch (e) {
      var error = ApiException.fromDioError(e);
      throw error.errorMessage;
    }
  }
}
