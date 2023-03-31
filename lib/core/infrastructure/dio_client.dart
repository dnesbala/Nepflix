import 'package:dio/dio.dart';
import 'package:nepflix/core/infrastructure/dio_interceptor.dart';

class DioClient {
  final _dio = Dio();

  DioClient() {
    _dio.interceptors.add(DioInterceptor());
  }

  Dio get dio => _dio;
}
