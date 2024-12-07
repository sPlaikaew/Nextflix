import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:nextflix/data/local/secure_storage_access.dart';
import 'package:nextflix/data/remote/http_request.dart';
import 'package:nextflix/data/model/token.dart';
import 'package:nextflix/utils/env/env_config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpClient extends HttpRequest {
  final Dio dio;
  final SecureStorageAccess secureStorage;
  HttpClient(this.dio, this.secureStorage) {
    dio.interceptors.add(interceptorsRequestWrapper());
    dio.interceptors.add(interceptorsRefreshTokenWrapper());
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
  }

  InterceptorsWrapper interceptorsRequestWrapper() => InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? token =
              await secureStorage.readData(EnvConfig.accessTokenKey);
          options.headers['Content-Type'] = 'application/json';
          options.headers["x-api-key"] = "ANY";
          options.headers['Accept-Language'] = "EN";
          if (token != null) {
            options.headers['Authorization'] = "Bearer $token";
          }
          return handler.next(options);
        },
      );

  InterceptorsWrapper interceptorsRefreshTokenWrapper() => InterceptorsWrapper(
        onError: (e, handler) async {
          String? token =
              await secureStorage.readData(EnvConfig.accessTokenKey);
          if (e.response?.statusCode == 401 && token != null) {
            Response refreshResponse = await dio.post('/auth/refreshToken');
            if (refreshResponse.statusCode == 200) {
              Token token = Token.fromJson(refreshResponse.data);
              await secureStorage.saveData(
                EnvConfig.accessTokenKey,
                token.accessToken,
              );
              await secureStorage.saveData(
                EnvConfig.accessTokenKey,
                token.refreshToken,
              );
              return handler.resolve(await retry(e.requestOptions));
            }
          }
          return handler.next(e);
        },
      );

  Future<Response<dynamic>> retry(RequestOptions requestOptions) async {
    var resendResponse = await _createOperation(
      requestOptions.path,
      method: requestOptions.method,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      headers: requestOptions.headers,
    );
    return resendResponse;
  }

  Future<Response> _createOperation(
    String path, {
    required String method,
    data,
    headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response result = await dio.request(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(method: method, headers: headers),
    );
    return result;
  }

  @override
  Future<Response> get(
    String path, {
    dynamic headers,
    dynamic query,
  }) async {
    return await _createOperation(
      path,
      method: "GET",
      headers: headers,
      queryParameters: query,
    );
  }

  @override
  Future<Response> post(
    String path, {
    dynamic headers,
    dynamic body,
  }) async {
    return await _createOperation(
      path,
      method: "POST",
      headers: headers,
      data: body,
    );
  }
}
