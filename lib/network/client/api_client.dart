import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:interceptor_impl/network/interceptors/custom_interceptor.dart';

import '../rest_constants.dart';

// Singleton, Http-Client Provider
class ApiClient {
  static final ApiClient _converter = ApiClient._internal();

  static const String kRequiredHeader = 'Header';
  static const String kAuthorization = 'Authorization';

  factory ApiClient() {
    return _converter;
  }

  ApiClient._internal();

  Dio dio() {
    var dio = Dio(
      BaseOptions(
        connectTimeout: 10000,
        receiveTimeout: 10000,
        baseUrl: RestConstants.kStagingBaseUrl,
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        request: true,
        error: true,
        requestHeader: true,
        responseBody: true,
      ));
    }

    dio.interceptors.add(CustomInterceptor());

    return dio;
  }
}
