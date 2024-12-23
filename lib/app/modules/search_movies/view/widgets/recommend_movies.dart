import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nextflix/core/utils/images/images.dart';
import 'package:nextflix/injections/home.dart';

import '../../../../data/model/movies.dart';

class RecommendMovies extends StatelessWidget {
  final List<Movie> movies;
  const RecommendMovies({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Modular.to.pushNamed(
              HomePageType.movieDetail.path,
              arguments: movies[index].id,
            );
          },
          child: Row(
            children: [
              SizedBox(
                width: 144,
                height: 75,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: CachedNetworkImage(
                    imageUrl: movies[index].cover.thumbnailUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Container(color: Colors.grey),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Container(
                constraints: const BoxConstraints(maxWidth: 140),
                child: Text(
                  movies[index].name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset(
                    CommonImage.playImage,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 6),
    );
  }
}
