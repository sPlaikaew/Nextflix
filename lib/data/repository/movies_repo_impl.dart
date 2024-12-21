import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:nextflix/data/data_sources/movies_data_source.dart';
import 'package:nextflix/domain/repository/movies_repo.dart';
import 'package:nextflix/data/model/error_msg.dart';
import 'package:nextflix/data/model/movies.dart';
import 'package:nextflix/data/remote/handle_dio_exception.dart';

class MoviesRepoImpl implements MoviesRepo {
  final MoviesDataSource moviesDataSource;
  MoviesRepoImpl(this.moviesDataSource);

  @override
  Future<Either<ErrorMsg, Movies>> getHighLightMovies() async {
    try {
      final highLightMovies = await moviesDataSource.getHighLightMovies();
      return Right(highLightMovies);
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }

  @override
  Future<Either<ErrorMsg, Movies>> getTrendMovies() async {
    try {
      final trendMovies = await moviesDataSource.getTrendMovies();
      return Right(trendMovies);
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }

  @override
  Future<Either<ErrorMsg, Movies>> getMustWatchMovies() async {
    try {
      final mustWatchMovies = await moviesDataSource.getMustWatchMovies();
      return Right(mustWatchMovies);
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }

  @override
  Future<Either<ErrorMsg, Movies>> getMyMovies() async {
    try {
      final myMovies = await moviesDataSource.getMyMovies();
      return Right(myMovies);
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }

  @override
  Future<Either<ErrorMsg, Movie>> getMovieDetail(String movieID) async {
    try {
      final movieDetail = await moviesDataSource.getMovieDetail(movieID);
      return Right(movieDetail);
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }
}
