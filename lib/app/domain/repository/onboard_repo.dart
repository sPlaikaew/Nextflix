import 'package:either_dart/either.dart';

import '../../data/model/error_msg.dart';

abstract class OnboardRepo {
  Future<Either<ErrorMsg, bool>> signIn(String email, String password);
}