import 'package:dio/dio.dart';

abstract class HttpDataSource {
  Future<Response> get(
    String path, {
    dynamic headers,
    dynamic query,
  });

  Future<Response> post(
    String path, {
    dynamic headers,
    dynamic body,
  });
}
