import 'package:dio/dio.dart';
import 'package:nextflix/data/model/profile.dart';
import 'package:nextflix/data/remote/http_request.dart';

class ProfileDataSource {
  final HttpRequest httpRequest;
  ProfileDataSource(
    this.httpRequest,
  );

  Future<List<Profile>> getAllProfiles() async {
    Response response = await httpRequest.get(
      '/profiles',
    );
    final profiles =
        (response.data as List).map((e) => Profile.fromJson(e)).toList();
    return profiles;
  }
}
