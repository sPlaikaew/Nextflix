import 'package:dio/dio.dart';
import 'package:nextflix/data/local/secure_storage_access.dart';
import 'package:nextflix/data/model/token.dart';
import 'package:nextflix/data/remote/http_request.dart';

class OnboardDataSource {
  final HttpRequest httpRequest;
  final SecureStorageAccess secureStorage;
  OnboardDataSource(
    this.httpRequest,
    this.secureStorage,
  );

  Future<Token> signIn(String email, String password) async {
    Response response = await httpRequest.post(
      '/auth/emailPass',
      body: {
        "email": email,
        "password": password,
      },
    );
    Token token = Token.fromJson(response.data);
    return token;
  }
}
