import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:nextflix/data/data_sources/onboard_data_source.dart';
import 'package:nextflix/data/data_sources/secure_storage_data_source.dart';
import 'package:nextflix/data/model/error_msg.dart';
import 'package:nextflix/data/remote/handle_dio_exception.dart';
import 'package:nextflix/domain/repository/onboard_repo.dart';

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
