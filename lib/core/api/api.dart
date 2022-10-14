// ignore_for_file: non_constant_identifier_names
import 'package:dio/dio.dart';

abstract class Api {
  Dio get _dio => _initDio();
  static String BASE_URL =
      "https://3b4e-2405-4802-a215-79c0-fc12-7dfb-341e-ccff.ap.ngrok.io/api/v2.0";
  Dio _initDio() {
    final Dio dio = Dio();

    dio
      ..options.baseUrl = BASE_URL
      ..options.connectTimeout = 6000
      ..options.receiveTimeout = 6000 //6s
      ..options.headers = {
        'Content-Type': 'application/json; charset=utf-8',
      };

    return dio;
  }

  Future<Response> postService(
    String endpoint, {
    required dynamic data,
    Map<String, dynamic>? query,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgres,
  }) async {
    try {
      final response = await _dio.post(
        BASE_URL + endpoint,
        data: data,
        queryParameters: query,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgres,
      );
      return response;
    } on Exception {
      rethrow;
    }
  }

  Future<Response> getService(
    String endpoint, {
    Map<String, dynamic>? query,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgres,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: query,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgres,
      );
      return response;
    } on Exception {
      rethrow;
    }
  }
}
