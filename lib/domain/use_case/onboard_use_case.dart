import 'package:either_dart/either.dart';
import 'package:nextflix/data/model/error_msg.dart';
import 'package:nextflix/data/repository/onboard_repo_impl.dart';

class OnboardUseCase {
  final OnboardRepoImpl authenticationRepo;
  OnboardUseCase({required this.authenticationRepo});
  Future<Either<ErrorMsg, int>> signIn(String email, String password) async {
    final response = await authenticationRepo.signIn(email, password);
    return response;
  }
}
