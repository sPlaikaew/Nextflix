import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextflix/app/modules/movie_detail/view/widgets/collection_page.dart';
import 'package:nextflix/app/modules/movie_detail/view/widgets/more_like_page.dart';
import 'package:nextflix/app/modules/movie_detail/view/widgets/tab_view.dart';
import 'package:nextflix/core/utils/env/env_config.dart';
import 'package:nextflix/core/utils/images/images.dart';
import 'package:nextflix/core/utils/widgets/btn_common.dart';
import 'package:nextflix/core/utils/widgets/btn_image.dart';
import 'package:nextflix/localization/app_localization.dart';
import 'package:nextflix/localization/translations/translations.i69n.dart';

import '../../../data/model/movies.dart';
import '../bloc/movie_detail_bloc.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        color: Colors.black,
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          buildWhen: (previous, current) => previous.loading != current.loading,
          builder: (context, state) {
            if (state.loading) {
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
            } else if (state.isMovieDetailError) {
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
                        BlocProvider.of<MovieDetailBloc>(context)
                            .add(GetMovieDetail());
                      },
                      text: localizations.common.refresh,
                    )
                  ],
                ),
              );
            }
            return _buildContent(state.movieDetail!, localizations);
          },
        ),
      ),
    );
  }

  Widget _buildContent(Movie movie, Translations localizations) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 180,
                width: MediaQuery.of(context).size.width,
                child: CachedNetworkImage(
                  imageUrl: movie.cover.thumbnailUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(color: Colors.grey),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '2015',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(height: 15),
                    BtnCommon(
                      onPress: () {},
                      text: localizations.common.play,
                      height: 48,
                      color: Colors.white,
                      textColor: Colors.black,
                      width: MediaQuery.of(context).size.width,
                      borderRadius: 2,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      EnvConfig.textContentMock,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 26),
                    Padding(
                      padding: const EdgeInsets.only(left: 23, right: 23),
                      child: Row(
                        children: [
                          BtnImage(
                              onPress: () {},
                              text: localizations.common.myList,
                              imagePath: CommonImage.addImage),
                          const SizedBox(width: 30),
                          BtnImage(
                              onPress: () {},
                              text: localizations.common.rate,
                              imagePath: CommonImage.likeImage),
                          const SizedBox(width: 30),
                          BtnImage(
                              onPress: () {},
                              text: localizations.common.share,
                              imagePath: CommonImage.sendImage),
                        ],
                      ),
                    ),
                    const SizedBox(height: 17),
                    TabView(
                      contentScreen: {
                        localizations.detailPage.collection: CollectionPage(movie: movie),
                        localizations.detailPage.moreLikeThis: const MoreLikePage(),
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
