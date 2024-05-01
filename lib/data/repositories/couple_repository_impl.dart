// ignore_for_file: deprecated_member_use
import 'package:counting_love_day/data/models/RequestCoupleModel.dart';
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
      int code = int.parse(response['code'].toString());
      return code;
    } on DioError catch (e) {
      var error = ApiException.fromDioError(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<List<RequestCoupleModel>> getListRequest({
    required String token,
  }) async {
    List<RequestCoupleModel> listRequest = [];
    try {
      Map<String, String>? headers = {'Authorization': token};
      dynamic response = await DioClient.instance.get(
        coupleInvite,
        options: Options(headers: headers),
      );
      for (var item in response['data']) {
        RequestCoupleModel request = RequestCoupleModel.fromJson(item);
        listRequest.add(request);
      }
      return listRequest;
    } catch (exception) {
      print(exception.toString());
      return [];
    }
  }

  @override
  Future<dynamic> sendRequestInvite({
    required String token,
    required String email,
  }) async {
    try {
      Map<String, String>? headers = {'Authorization': token};
      dynamic response = await DioClient.instance.post(
        coupleInvite,
        data: {'invited_email': email},
        options: Options(headers: headers),
      );
      int code = int.parse(response['code'].toString());
      return code;
    } catch (exception) {
      print(exception.toString());
    }
  }
}
