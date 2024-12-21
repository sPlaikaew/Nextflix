import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nextflix/data/model/movies.dart';
import 'package:nextflix/injections/home.dart';

class CarouselSliderMovies extends StatefulWidget {
  final List<Movie> highLightMovies;
  final ValueChanged<int> onChanged;
  const CarouselSliderMovies({
    super.key,
    required this.highLightMovies,
    required this.onChanged,
  });

  @override
  State<CarouselSliderMovies> createState() => _CarouselSliderMoviesState();
}

class _CarouselSliderMoviesState extends State<CarouselSliderMovies> {
  final CarouselSliderController carouselController =
      CarouselSliderController();
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: widget.highLightMovies.length,
          itemBuilder: (BuildContext context, int index, int pageViewIndex) {
            return GestureDetector(
              onTap: () {
                Modular.to.pushNamed(
                  HomePageType.movieDetail.path,
                  arguments: widget.highLightMovies[index].id,
                );
              },
              child: CachedNetworkImage(
                imageUrl: widget.highLightMovies[index].cover.thumbnailUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(color: Colors.grey),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.white,
                ),
              ),
            );
          },
          options: CarouselOptions(
              height: 511.0,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {
                setState(() {
                  current = index;
                  widget.onChanged(current);
                });
              }),
          carouselController: carouselController,
        ),
        Positioned(
          bottom: 80,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.highLightMovies.asMap().entries.map((entry) {
              return Container(
                width: 6.0,
                height: 6.0,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      Colors.white.withOpacity(current == entry.key ? 1 : 0.6),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
