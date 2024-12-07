import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:nextflix/data/data_sources/onboard_data_source.dart';
import 'package:nextflix/data/local/secure_storage.dart';
import 'package:nextflix/data/model/error_msg.dart';
import 'package:nextflix/data/model/token.dart';
import 'package:nextflix/data/remote/handle_dio_exception.dart';
import 'package:nextflix/data/remote/http_client.dart';
import 'package:nextflix/utils/env/env_config.dart';

class OnboardRepoImpl extends OnboardDataSource {
  final HttpClient httpClient;
  final SecureStorage secureStorage;
  OnboardRepoImpl({required this.httpClient, required this.secureStorage});

  @override
  Future<Either<ErrorMsg, int>> signIn(String email, String password) async {
    try {
      Response response = await httpClient.post(
        '/auth/emailPass',
        body: {
          "email": email,
          "password": password,
        },
      );
      Token token = Token.fromJson(response.data);
      await secureStorage.saveData(EnvConfig.accessTokenKey, token.accessToken);
      await secureStorage.saveData(EnvConfig.refreshToken, token.refreshToken);
      return Right(response.statusCode!);
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }
}
