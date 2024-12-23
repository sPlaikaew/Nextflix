import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String id;
  final String name;
  final String profileUrl;

  const ProfileEntity({
    required this.id,
    required this.name,
    required this.profileUrl,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      profileUrl,
    ];
  }
}
