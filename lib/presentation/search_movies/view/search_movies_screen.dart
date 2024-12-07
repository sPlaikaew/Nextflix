import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextflix/data/model/movies.dart';
import 'package:nextflix/localization/app_localization.dart';
import 'package:nextflix/presentation/search_movies/bloc/search_movies_bloc.dart';
import 'package:nextflix/presentation/search_movies/view/widgets/recommend_movies.dart';

class SearchMoviesScreen extends StatefulWidget {
  const SearchMoviesScreen({super.key});

  @override
  State<SearchMoviesScreen> createState() => _SearchMoviesScreenState();
}

class _SearchMoviesScreenState extends State<SearchMoviesScreen> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: localizations.searchPage.searchHint,
                labelStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                filled: true,
                fillColor: Colors.white.withOpacity(0.15),
              ),
              onChanged: (value) => BlocProvider.of<SearchMoviesBloc>(context)
                  .add(SearchMovies(value)),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      localizations.searchPage.recommend,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
                        buildWhen: (previous, current) =>
                            previous.loading != current.loading ||
                            previous.movies != current.movies,
                        builder: (context, state) {
                          if (state.loading) {
                            return Container(
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(),
                            );
                          }
                          return _buildContent(state.movies!);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(List<Movie> movies) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Expanded(
          child: RecommendMovies(movies: movies),
        ),
      ],
    );
  }
}
