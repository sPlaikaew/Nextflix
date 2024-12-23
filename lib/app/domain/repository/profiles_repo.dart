import 'package:either_dart/either.dart';
import 'package:nextflix/app/domain/entities/profile_entity.dart';

import '../../data/model/error_msg.dart';

abstract class ProfilesRepo {
  Future<Either<ErrorMsg, List<ProfileEntity>>> getAllProfiles();
}
