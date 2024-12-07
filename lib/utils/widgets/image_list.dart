import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nextflix/data/model/movies.dart';
import 'package:nextflix/injections/home.dart';

class ImageList extends StatelessWidget {
  final double height;
  final double width;
  final List<Movie> movies;
  const ImageList({
    super.key,
    required this.movies,
    this.height = 150,
    this.width = 100,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Modular.to.pushNamed(
                HomePageType.movieDetail.path,
                arguments: movies[index].id,
              );
            },
            child: SizedBox(
              width: width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(
                  imageUrl: movies[index].cover.thumbnailUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(color: Colors.grey),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: 10),
      ),
    );
  }
}
