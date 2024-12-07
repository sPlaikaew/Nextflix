import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:nextflix/data/data_sources/http_data_source.dart';
import 'package:nextflix/data/data_sources/movies_data_source.dart';
import 'package:nextflix/data/model/error_msg.dart';
import 'package:nextflix/data/model/movies.dart';
import 'package:nextflix/data/remote/handle_dio_exception.dart';

class MoviesRepoImpl extends MoviesDataSource {
  final HttpDataSource httpClient;
  MoviesRepoImpl(this.httpClient);

  @override
  Future<Either<ErrorMsg, Movies>> getHighLightMovies() async {
    try {
      Response response = await httpClient.get('/movies/high-light');
      return Right(Movies.fromJson(response.data));
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }

  @override
  Future<Either<ErrorMsg, Movies>> getTrendMovies() async {
    try {
      Response response = await httpClient.get('/movies/trend');
      return Right(Movies.fromJson(response.data));
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }

  @override
  Future<Either<ErrorMsg, Movies>> getMustWatchMovies() async {
    try {
      Response response = await httpClient.get('/movies/must-watch');
      return Right(Movies.fromJson(response.data));
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }

  @override
  Future<Either<ErrorMsg, Movies>> getMyMovies() async {
    try {
      Response response = await httpClient.get('/movies/my');
      return Right(Movies.fromJson(response.data));
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }

  @override
  Future<Either<ErrorMsg, Movie>> getMovieDetail(String movieID) async {
    try {
      Response response = await httpClient.get('/movies/$movieID');
      return Right(Movie.fromJson(response.data));
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }
}
