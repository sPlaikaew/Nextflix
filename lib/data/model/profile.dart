import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));
String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  String id;
  String name;
  String profileUrl;

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
}
