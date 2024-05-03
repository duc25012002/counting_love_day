// ignore_for_file: library_prefixes, deprecated_member_use
import 'package:counting_love_day/data/repositories/local_datasource_impl.dart';
import 'package:dio/dio.dart';
import 'package:xml/xml.dart';
import '../../../app/configs/api_config.dart' as url;
import '../../../app/configs/api_config.dart';
import '../../../app/util/util_log.dart';

class DioClient {
  /// ProgressCallback? onSendProgress, theo dõi tiến trình gửi đi
  /// ProgressCallback? onReceiveProgress, theo dõi tiến trình nhận
  DioClient._();
  static final instance = DioClient._();

  final LocalDataSourceImpl _localDataSourceImpl = LocalDataSourceImpl();

  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: url.baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        responseType: ResponseType.json),
  );

  witHandleXml(Response response, String xmlString) async {
    final document = XmlDocument.parse(response.data);
    final List<XmlElement> codeList =
        document.findAllElements(xmlString).toList();

    if (codeList.isNotEmpty) {
      final XmlElement dataElement = codeList.first;

      final String data = dataElement.text;

      if (xmlString == 'token') {
        await _localDataSourceImpl.saveToken(data);
      } else {
        return data;
      }
    }
  }

  ///Get Method
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (path == couple) {
        log.d("DATA RETURN:: ${response.data}");
      }
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      log.e(e.toString());
    }
  }

  ///Post Method
  Future<dynamic> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      log.d("DATA POST:: $data");
      final Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      // XML SCHEMA
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (path == login ||
            path == register ||
            path == checkMail ||
            path == verifyEmail) {
          witHandleXml(response, 'token');

          return witHandleXml(response, 'code');
        } else {
          return response.data;
        }
      }
    } catch (e) {
      log.e(e.toString());
    }
  }

  ///Put Method
  Future<Map<String, dynamic>> put(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200) {
        return response.data;
      }
      throw "something went wrong";
    } catch (e) {
      rethrow;
    }
  }

  ///Delete Method
  Future<dynamic> delete(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      if (response.statusCode == 204) {
        return response.data;
      }
      throw "something went wrong";
    } catch (e) {
      rethrow;
    }
  }
}
