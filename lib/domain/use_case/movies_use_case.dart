import 'package:either_dart/either.dart';
import 'package:nextflix/data/data_sources/movies_data_source.dart';
import 'package:nextflix/data/model/error_msg.dart';
import 'package:nextflix/data/model/movies.dart';

class MoviesUseCase {
  final MoviesDataSource moviesDataSource;
  MoviesUseCase(this.moviesDataSource);
  Future<Either<ErrorMsg, Movies>> getHighLightMovies() async {
    final highLightMovies = await moviesDataSource.getHighLightMovies();
    return highLightMovies;
  }

  Future<Either<ErrorMsg, Movies>> getTrendMovies() async {
    final trendMovies = await moviesDataSource.getTrendMovies();
    return trendMovies;
  }

  Future<Either<ErrorMsg, Movies>> getMustWatchMovies() async {
    final mustWatchMovies = await moviesDataSource.getMustWatchMovies();
    return mustWatchMovies;
  }

  Future<Either<ErrorMsg, Movies>> getMyMovies() async {
    final mustWatchMovies = await moviesDataSource.getMyMovies();
    return mustWatchMovies;
  }

  Future<Either<ErrorMsg, Movie>> getMovieDetail(String movieID) async {
    final movieDetail = await moviesDataSource.getMovieDetail(movieID);
    return movieDetail;
  }
}
