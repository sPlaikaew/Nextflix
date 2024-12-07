import 'package:either_dart/either.dart';
import 'package:nextflix/data/data_sources/profiles_data_source.dart';
import 'package:nextflix/data/model/error_msg.dart';
import 'package:nextflix/data/model/profile.dart';

class ProfilesUseCase {
  final ProfilesDataSource profilesDataSource;
  ProfilesUseCase(this.profilesDataSource);
  Future<Either<ErrorMsg, List<Profile>>> getAllProfiles() async {
    final profiles = await profilesDataSource.getAllProfiles();
    return profiles;
  }
}
