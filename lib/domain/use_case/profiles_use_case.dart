import 'package:either_dart/either.dart';
import 'package:nextflix/data/model/error_msg.dart';
import 'package:nextflix/data/model/profile.dart';
import 'package:nextflix/data/repository/profiles_repo_impl.dart';

class ProfilesUseCase {
  final ProfilesRepoImpl profilesRepo;
  ProfilesUseCase({required this.profilesRepo});
  Future<Either<ErrorMsg, List<Profile>>> getAllProfiles() async {
    final profiles = await profilesRepo.getAllProfiles();
    return profiles;
  }
}
