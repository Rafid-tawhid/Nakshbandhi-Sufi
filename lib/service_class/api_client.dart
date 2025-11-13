// core/api_service.dart
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(String baseUrl)
      : dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {'Content-Type': 'application/json'},
  )) {
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  Future<Map<String, dynamic>> post(String path, Map<String, dynamic> body) async {
    final response = await dio.post(path, data: body);
    return response.data as Map<String, dynamic>;
  }
}
