import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nextflix/app/data/model/movies.dart';
import 'package:nextflix/app/modules/search_movies/bloc/search_movies_bloc.dart';

void main() {
  group('Unit test search movies', () {
    late SearchMoviesBloc searchMoviesBloc;

    Movie movie1 = Movie(
      id: '111',
      priority: 'priority',
      category: 'category',
      name: 'hello',
      cover: Cover(
        thumbnailUrl: 'thumbnailUrl',
        originalUrl: 'originalUrl',
        trailerUrl: 'trailerUrl',
      ),
      metaData: MetaData(
        filmLength: 11,
        continueSeconds: 22,
      ),
    );

    Movie movie2 = Movie(
      id: '222',
      priority: 'priority',
      category: 'category',
      name: 'world',
      cover: Cover(
        thumbnailUrl: 'thumbnailUrl',
        originalUrl: 'originalUrl',
        trailerUrl: 'trailerUrl',
      ),
      metaData: MetaData(
        filmLength: 11,
        continueSeconds: 22,
      ),
    );

    Movie movie3 = Movie(
      id: '333',
      priority: 'priority',
      category: 'category',
      name: 'dart',
      cover: Cover(
        thumbnailUrl: 'thumbnailUrl',
        originalUrl: 'originalUrl',
        trailerUrl: 'trailerUrl',
      ),
      metaData: MetaData(
        filmLength: 11,
        continueSeconds: 22,
      ),
    );

    List<Movie> moviesList = [movie1, movie2, movie3];

    setUp(() {
      searchMoviesBloc = SearchMoviesBloc(moviesList);
    });

    tearDown(() {
      searchMoviesBloc.close();
    });

    blocTest<SearchMoviesBloc, SearchMoviesState>(
      'Search movies case 1',
      build: () {
        return searchMoviesBloc;
      },
      act: (bloc) => bloc.add(const SearchMovies('da')),
      expect: () => [
        SearchMoviesState(movies: [movie3])
      ],
    );

    blocTest<SearchMoviesBloc, SearchMoviesState>(
      'Search movies case 2',
      build: () {
        return searchMoviesBloc;
      },
      act: (bloc) => bloc.add(const SearchMovies('l')),
      expect: () => [
        SearchMoviesState(movies: [movie1,movie2])
      ],
    );

    blocTest<SearchMoviesBloc, SearchMoviesState>(
      'Search movies case empty',
      build: () {
        return searchMoviesBloc;
      },
      act: (bloc) => bloc.add(const SearchMovies('flutter')),
      expect: () => [
        const SearchMoviesState(movies: [])
      ],
    );
  });
}
