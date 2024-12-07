import 'package:either_dart/either.dart';
import 'package:nextflix/data/model/error_msg.dart';
import 'package:nextflix/data/model/profile.dart';

abstract class ProfilesDataSource {
  Future<Either<ErrorMsg, List<Profile>>> getAllProfiles();
}
