import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nextflix/data/model/movies.dart';
import 'package:nextflix/data/model/profile.dart';
import 'package:nextflix/injections/home.dart';
import 'package:nextflix/localization/app_localization.dart';
import 'package:nextflix/localization/translations/translations.i69n.dart';
import 'package:nextflix/presentation/home/bloc/home_bloc.dart';
import 'package:nextflix/presentation/home/view/widgets/carousel_slider_movies.dart';
import 'package:nextflix/utils/images/images.dart';
import 'package:nextflix/utils/widgets/btn_common.dart';
import 'package:nextflix/utils/widgets/image_list.dart';

class HomeScreen extends StatefulWidget {
  final Profile profile;
  const HomeScreen({super.key, required this.profile});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (previous, current) =>
                previous.isHighLightMoviesLoading !=
                    current.isHighLightMoviesLoading ||
                previous.isTrendMoviesLoading != current.isTrendMoviesLoading ||
                previous.isMustWatchMoviesLoading !=
                    current.isMustWatchMoviesLoading ||
                previous.isMyMoviesLoading != current.isMyMoviesLoading,
            builder: (context, state) {
              if (state.isHighLightMoviesLoading ||
                  state.isTrendMoviesLoading ||
                  state.isMustWatchMoviesLoading ||
                  state.isMyMoviesLoading) {
                return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                );
              } else if (state.isHighLightMoviesError ||
                  state.isTrendMoviesError ||
                  state.isMustWatchMoviesError ||
                  state.isMyMoviesError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.errorMsg!,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      BtnCommon(
                        onPress: () {
                          BlocProvider.of<HomeBloc>(context)
                            ..add(GetHighLightMovies())
                            ..add(GetTrendMovies())
                            ..add(
                              GetMostWatchMovies(),
                            );
                        },
                        text: localizations.common.refresh,
                      )
                    ],
                  ),
                );
              }
              return _buildContent(
                state.highLightMovies!,
                state.trendMovies!,
                state.mustWatchMovies!,
                state.myMovies!,
                widget.profile,
                localizations,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    Movies highLightMovies,
    Movies trendMovies,
    Movies mustWatchMovies,
    Movies myMovies,
    Profile profile,
    Translations localizations,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              CarouselSliderMovies(
                highLightMovies: highLightMovies.moviesList,
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Image.asset(
                  LogoImage.nextflixLogo,
                  height: 33,
                  width: 22,
                ),
              ),
              Positioned(
                top: 16,
                right: 12,
                child: GestureDetector(
                  onTap: () => Modular.to.pushNamed(
                    HomePageType.searchMovies.path,
                    arguments: trendMovies.moviesList,
                  ),
                  child: SvgPicture.asset(
                    CommonImage.searchImage,
                  ),
                ),
              ),
              Positioned(
                bottom: 19,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BtnCommon(
                      onPress: () {},
                      text: localizations.common.play,
                      color: Colors.white,
                      textColor: Colors.black,
                    ),
                    const SizedBox(width: 26),
                    BtnCommon(
                      onPress: () {},
                      text: localizations.common.myList,
                      color: Colors.white.withOpacity(0.2),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Column(
              children: [
                buildTrendMovies(trendMovies, localizations),
                buildMustWatchMovies(mustWatchMovies, localizations),
                buildContinueMovies(myMovies, profile, localizations),
                buildOnlyNextFlix(highLightMovies, localizations),
                buildMyMovies(myMovies, localizations),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTrendMovies(Movies trendMovies, Translations localizations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Text(
            localizations.homePage.trendingNow,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ImageList(
          movies: trendMovies.moviesList,
        ),
      ],
    );
  }

  Widget buildMustWatchMovies(
      Movies mustWatchMovies, Translations localizations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 29),
        Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Text(
            localizations.homePage.mustWatch,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ImageList(
          movies: mustWatchMovies.moviesList,
        ),
      ],
    );
  }

  Widget buildContinueMovies(
      Movies myMovies, Profile profile, Translations localizations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 29),
        Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Text(
            '${localizations.homePage.continueWatching} ${profile.name}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ImageList(
          movies: myMovies.moviesList,
        ),
      ],
    );
  }

  Widget buildOnlyNextFlix(Movies highLightMovies, Translations localizations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 29),
        Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Text(
            localizations.homePage.onlyNextFlix,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ImageList(
          movies: highLightMovies.moviesList,
          height: 300,
          width: 150,
        ),
      ],
    );
  }

  Widget buildMyMovies(Movies myMovies, Translations localizations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 29),
        Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Text(
            localizations.common.myList,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ImageList(
          movies: myMovies.moviesList,
        ),
      ],
    );
  }
}
