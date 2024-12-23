import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextflix/app/data/model/error_msg.dart';
import 'package:nextflix/app/data/model/movies.dart';
import 'package:nextflix/app/domain/use_case/movies_use_case.dart';
import 'package:nextflix/app/modules/movie_detail/bloc/movie_detail_bloc.dart';

class MockMoviesUseCase extends Mock implements MoviesUseCase {}

void main() {
  group('Unit test movie detail', () {
    late MoviesUseCase moviesUseCase;
    late MovieDetailBloc movieDetailBloc;

    ErrorMsg error = ErrorMsg('error');

    Movie movie = Movie(
      id: '123',
      priority: 'priority',
      category: 'category',
      name: 'name',
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

    setUp(() {
      moviesUseCase = MockMoviesUseCase();
      movieDetailBloc = MovieDetailBloc(moviesUseCase, '123');
    });

    tearDown(() {
      movieDetailBloc.close();
    });

    blocTest<MovieDetailBloc, MovieDetailState>(
      'Get movie detail',
      build: () {
        when(() => moviesUseCase.getMovieDetail('123'))
            .thenAnswer((_) async => Right(movie));
        return movieDetailBloc;
      },
      act: (bloc) => bloc.add(GetMovieDetail()),
      expect: () => [
        const MovieDetailState(
          loading: true,
        ),
        MovieDetailState(
          loading: false,
          isMovieDetailError: false,
          movieDetail: movie,
        ),
      ],
    );

    blocTest<MovieDetailBloc, MovieDetailState>(
      'Get error',
      build: () {
        when(() => moviesUseCase.getMovieDetail('123'))
            .thenAnswer((_) async => Left(error));
        return movieDetailBloc;
      },
      act: (bloc) => bloc.add(GetMovieDetail()),
      expect: () => [
        const MovieDetailState(
          loading: true,
        ),
        MovieDetailState(
          loading: false,
          isMovieDetailError: true,
          errorMsg: error.message,
        ),
      ],
    );
  });
}
