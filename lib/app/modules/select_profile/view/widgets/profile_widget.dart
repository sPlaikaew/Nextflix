import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nextflix/app/domain/entities/profile_entity.dart';
import 'package:nextflix/injections/home.dart';

class ProfileWidget extends StatelessWidget {
  final ProfileEntity profile;
  const ProfileWidget({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Modular.to.pushNamed(
              HomePageType.main.path,
              arguments: profile,
            );
          },
          child: SizedBox(
            width: 110,
            height: 110,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: CachedNetworkImage(
                imageUrl: profile.profileUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(color: Colors.grey),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          profile.name.length > 12
              ? '${profile.name.substring(0, 9)}...'
              : profile.name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
