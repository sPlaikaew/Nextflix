import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:nextflix/app/domain/entities/profile_entity.dart';

import '../mappers/entity_convertable.dart';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));
String profileToJson(Profile data) => json.encode(data.toJson());

class Profile extends Equatable with EntityConvertible<Profile, ProfileEntity> {
  final String id;
  final String name;
  final String profileUrl;

  Profile({
    required this.id,
    required this.name,
    required this.profileUrl,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        name: json["name"],
        profileUrl: json["profileUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "profileUrl": profileUrl,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      profileUrl,
    ];
  }

  @override
  ProfileEntity toEntity() => ProfileEntity(
        id: id,
        name: name,
        profileUrl: profileUrl,
      );

  @override
  Profile fromEntity(ProfileEntity model) => Profile(
        id: model.id,
        name: model.name,
        profileUrl: model.profileUrl,
      );
}
