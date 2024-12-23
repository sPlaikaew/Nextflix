import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:nextflix/app/domain/entities/profile_entity.dart';
import 'package:nextflix/core/remote/handle_dio_exception.dart';

import '../../domain/repository/profiles_repo.dart';
import '../data_sources/profile_data_source.dart';
import '../model/error_msg.dart';

class ProfilesRepoImpl implements ProfilesRepo {
  final ProfileDataSource profileDataSource;
  ProfilesRepoImpl(
    this.profileDataSource,
  );

  @override
  Future<Either<ErrorMsg, List<ProfileEntity>>> getAllProfiles() async {
    try {
      final profiles = await profileDataSource.getAllProfiles();
      return Right(profiles.map((profile) => profile.toEntity()).toList());
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }
}
