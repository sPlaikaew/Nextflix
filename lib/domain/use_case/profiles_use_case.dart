import 'package:either_dart/either.dart';
import 'package:nextflix/data/model/error_msg.dart';
import 'package:nextflix/data/model/profile.dart';
import 'package:nextflix/domain/repository/profiles_repo.dart';

class ProfilesUseCase {
  final ProfilesRepo profilesRepo;
  ProfilesUseCase(
    this.profilesRepo,
  );
  Future<Either<ErrorMsg, List<Profile>>> getAllProfiles() async {
    final profiles = await profilesRepo.getAllProfiles();
    return profiles;
  }
}
