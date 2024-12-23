import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:nextflix/core/remote/handle_dio_exception.dart';

import '../../domain/repository/onboard_repo.dart';
import '../data_sources/onboard_data_source.dart';
import '../data_sources/secure_storage_data_source.dart';
import '../model/error_msg.dart';

class OnboardRepoImpl implements OnboardRepo {
  final SecureStorageDataSource secureStorageDataSource;
  final OnboardDataSource onboardDataSource;
  OnboardRepoImpl(
    this.secureStorageDataSource,
    this.onboardDataSource,
  );

  @override
  Future<Either<ErrorMsg, bool>> signIn(String email, String password) async {
    try {
      final token = await onboardDataSource.signIn(email, password);
      await secureStorageDataSource.saveToken(
        token.accessToken,
        token.refreshToken,
      );
      return const Right(true);
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }
}
