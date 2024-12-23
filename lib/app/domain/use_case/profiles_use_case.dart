import 'package:either_dart/either.dart';
import 'package:nextflix/app/domain/entities/profile_entity.dart';

import '../../data/model/error_msg.dart';
import '../repository/profiles_repo.dart';

class ProfilesUseCase {
  final ProfilesRepo profilesRepo;
  ProfilesUseCase(
    this.profilesRepo,
  );
  Future<Either<ErrorMsg, List<ProfileEntity>>> getAllProfiles() async {
    final profiles = await profilesRepo.getAllProfiles();
    return profiles;
  }
}
