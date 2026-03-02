import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:news_app/core/networking/api_endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;
  static void initDio() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    dio!.interceptors.add(PrettyDioLogger());
  }

  static Future<Response<dynamic>> getRequest({
    required String endpoint,
    required Map<String, dynamic> query,
  }) async {
    try {
      final response = await dio!.get(endpoint, queryParameters: query);
      return response;
    } catch (e) {
      log(e.toString());
    }
    throw Exception('Failed to perform GET request');
  }
}
