import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:nextflix/data/data_sources/http_data_source.dart';
import 'package:nextflix/data/data_sources/profiles_data_source.dart';
import 'package:nextflix/data/model/error_msg.dart';
import 'package:nextflix/data/model/profile.dart';
import 'package:nextflix/data/remote/handle_dio_exception.dart';

class ProfilesRepoImpl extends ProfilesDataSource {
  final HttpDataSource httpClient;
  ProfilesRepoImpl(this.httpClient);

  @override
  Future<Either<ErrorMsg, List<Profile>>> getAllProfiles() async {
    try {
      Response response = await httpClient.get('/profiles');
      return Right(
          (response.data as List).map((e) => Profile.fromJson(e)).toList());
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }
}
