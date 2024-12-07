import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:nextflix/data/data_sources/profiles_data_source.dart';
import 'package:nextflix/data/local/secure_storage.dart';
import 'package:nextflix/data/model/error_msg.dart';
import 'package:nextflix/data/model/profile.dart';
import 'package:nextflix/data/remote/handle_dio_exception.dart';
import 'package:nextflix/data/remote/http_client.dart';
import 'package:nextflix/utils/env/env_config.dart';

class ProfilesRepoImpl extends ProfilesDataSource {
  final HttpClient httpClient;
  final SecureStorage secureStorage;
  ProfilesRepoImpl({required this.httpClient, required this.secureStorage});

  @override
  Future<Either<ErrorMsg, List<Profile>>> getAllProfiles() async {
    try {
      final accessToken =
          await secureStorage.readData(EnvConfig.accessTokenKey);
      Response response = await httpClient.get(
        '/profiles',
        headers: {
          "Authorization": "Bearer $accessToken",
        },
      );
      return Right(
          (response.data as List).map((e) => Profile.fromJson(e)).toList());
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }
}
