// core/api_service.dart
import 'package:dio/dio.dart';
import 'package:dio/io.dart'; // IMPORTANT
import 'dart:io';

class ApiService {
  final Dio dio;

  ApiService(String baseUrl)
      : dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  ) {

    // Enable logging interceptor
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));

    // ⛔ Allow bad certificates (development only)
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<Map<String, dynamic>> post(
      String path, Map<String, dynamic> body) async {
    final response = await dio.post(path, data: body);
    return response.data as Map<String, dynamic>;
  }
}
