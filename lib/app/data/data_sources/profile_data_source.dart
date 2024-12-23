import 'package:dio/dio.dart';
import 'package:nextflix/core/remote/http_request.dart';

import '../model/profile.dart';

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
