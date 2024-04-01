import "dart:async";

import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:shared_preferences/shared_preferences.dart";

class DioSettings {
  late SharedPreferences prefs;
  DioSettings() {
    unawaited(setup());
  }

  Dio dio = Dio(
    BaseOptions(

      baseUrl: "http://91.210.169.237:8001",
      contentType: "application/json",
      headers: {
        // "Accept": "application/json",
        // "Authorization": "Token ${.getString("token")}"
      },
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  Future<void> setup() async {
    final Interceptors interceptors = dio.interceptors;

    interceptors.clear();

    final LogInterceptor logInterceptor = LogInterceptor(
      requestBody: true,
      responseBody: true,
    );

    final QueuedInterceptorsWrapper headerInterceptors =
        QueuedInterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) =>
          handler.next(options),
      onError: (DioException error, ErrorInterceptorHandler handler) {
        handler.next(error);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) =>
          handler.next(response),
    );
    interceptors.addAll([if (kDebugMode) logInterceptor, headerInterceptors]);
  }
}
