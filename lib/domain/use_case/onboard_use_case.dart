import 'package:either_dart/either.dart';
import 'package:nextflix/data/data_sources/onboard_data_source.dart';
import 'package:nextflix/data/model/error_msg.dart';

class OnboardUseCase {
  final OnboardDataSource onboardDataSource;
  OnboardUseCase(this.onboardDataSource);
  Future<Either<ErrorMsg, int>> signIn(String email, String password) async {
    final response = await onboardDataSource.signIn(email, password);
    return response;
  }
}
