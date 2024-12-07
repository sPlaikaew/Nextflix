import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:nextflix/data/remote/http_request.dart';
import 'package:nextflix/data/data_sources/profiles_data_source.dart';
import 'package:nextflix/data/model/error_msg.dart';
import 'package:nextflix/data/model/profile.dart';
import 'package:nextflix/data/remote/handle_dio_exception.dart';

class ProfilesRepoImpl extends ProfilesDataSource {
  final HttpRequest httpRequest;
  ProfilesRepoImpl(this.httpRequest);

  @override
  Future<Either<ErrorMsg, List<Profile>>> getAllProfiles() async {
    try {
      Response response = await httpRequest.get('/profiles');
      return Right(
          (response.data as List).map((e) => Profile.fromJson(e)).toList());
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }
}
