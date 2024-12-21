import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:nextflix/data/data_sources/profile_data_source.dart';
import 'package:nextflix/data/model/error_msg.dart';
import 'package:nextflix/data/model/profile.dart';
import 'package:nextflix/data/remote/handle_dio_exception.dart';
import 'package:nextflix/domain/repository/profiles_repo.dart';

class ProfilesRepoImpl implements ProfilesRepo {
  final ProfileDataSource profileDataSource;
  ProfilesRepoImpl(
    this.profileDataSource,
  );

  @override
  Future<Either<ErrorMsg, List<Profile>>> getAllProfiles() async {
    try {
      final profiles = await profileDataSource.getAllProfiles();
      return Right(profiles);
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }
}
