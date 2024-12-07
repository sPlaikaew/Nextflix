import 'package:either_dart/either.dart';
import 'package:nextflix/data/model/error_msg.dart';

abstract class OnboardDataSource {
  Future<Either<ErrorMsg, int>> signIn(String email, String password);
}