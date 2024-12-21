import 'package:either_dart/either.dart';
import 'package:nextflix/data/model/error_msg.dart';
import 'package:nextflix/domain/repository/onboard_repo.dart';

class OnboardUseCase {
  final OnboardRepo onboardRepo;
  OnboardUseCase(
    this.onboardRepo,
  );
  Future<Either<ErrorMsg, bool>> signIn(String email, String password) async {
    final isSuccess = await onboardRepo.signIn(email, password);
    return isSuccess;
  }
}
