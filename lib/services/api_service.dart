import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class ApiService {
  Dio _dio = Dio();
  final baseUrl = 'https://jsonplaceholder.typicode.com';
  final contentType = 'application/json; charset=UTF-8';

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        contentType: contentType,
      ),
    );
    initInterceptors();
  }

  Future<Response?> getRequest(String endPoint) async {
    try {
      Response response = await _dio.get(endPoint);

      if (response.statusCode! == 200) {
        return response;
      }

      return null;
    } on DioError catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    }
  }

  Future<Response?> postRequest(
      String endPoint, Map<String, dynamic>? body) async {
    try {
      Response response = await _dio.post(endPoint, data: body);

      if (response.statusCode! == 201) {
        return response;
      }

      return null;
    } on DioError catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    }
  }

  initInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          debugPrint('API Error: ${error.message}');
          return handler.next(error);
        },
        onRequest: (request, handler) {
          debugPrint('API Request: ${request.method} - ${request.uri}');
          return handler.next(request);
        },
        onResponse: (response, handler) {
          debugPrint('API Response: ${response.toString()}');
          return handler.next(response);
        },
      ),
    );
  }
}
