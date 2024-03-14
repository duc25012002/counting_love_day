// ignore_for_file: deprecated_member_use
import 'package:counting_love_day/app/services/log.dart';
import 'package:counting_love_day/domain/repositories/couple_repository.dart';
import 'package:dio/dio.dart';

import '../../app/configs/api_config.dart';
import '../../app/core/internet_services.dart';
import '../datasource/apis/dio_client.dart';

class CoupleRepositoryImpl implements CoupleRepository {
  @override
  Future<dynamic> checkCouple({required String token}) async {
    Map<String, String>? headers = {'Authorization': token};
    try {
      final response = await DioClient.instance.get(
        couple,
        options: Options(headers: headers),
      );
      return response;
    } on DioError catch (e) {
      log.i("aaaâ");
      var error = ApiException.fromDioError(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<dynamic> getListRequest({required String token}) async {
    try {
      Map<String, String>? headers = {'Authorization': token};
      final response = await DioClient.instance.get(
        coupleInvite,
        options: Options(headers: headers),
      );
      return response;
    } catch (exception) {
      print(exception.toString());
    }
  }
}
