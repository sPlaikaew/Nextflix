import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:nextflix/data/data_sources/movies_data_source.dart';
import 'package:nextflix/data/local/secure_storage.dart';
import 'package:nextflix/data/model/error_msg.dart';
import 'package:nextflix/data/model/movies.dart';
import 'package:nextflix/data/remote/handle_dio_exception.dart';
import 'package:nextflix/data/remote/http_client.dart';
import 'package:nextflix/utils/env/env_config.dart';

class MoviesRepoImpl extends MoviesDataSource {
  final HttpClient httpClient;
  final SecureStorage secureStorage;
  MoviesRepoImpl({required this.httpClient, required this.secureStorage});

  @override
  Future<Either<ErrorMsg, Movies>> getHighLightMovies() async {
    try {
      final accessToken =
          await secureStorage.readData(EnvConfig.accessTokenKey);
      Response response = await httpClient.get(
        '/movies/high-light',
        headers: {
          "Authorization": "Bearer $accessToken",
        },
      );
      return Right(Movies.fromJson(response.data));
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }

  @override
  Future<Either<ErrorMsg, Movies>> getTrendMovies() async {
    try {
      final accessToken =
          await secureStorage.readData(EnvConfig.accessTokenKey);
      Response response = await httpClient.get(
        '/movies/trend',
        headers: {
          "Authorization": "Bearer $accessToken",
        },
      );
      return Right(Movies.fromJson(response.data));
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }

  @override
  Future<Either<ErrorMsg, Movies>> getMustWatchMovies() async {
    try {
      final accessToken =
          await secureStorage.readData(EnvConfig.accessTokenKey);
      Response response = await httpClient.get(
        '/movies/must-watch',
        headers: {
          "Authorization": "Bearer $accessToken",
        },
      );
      return Right(Movies.fromJson(response.data));
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }

  @override
  Future<Either<ErrorMsg, Movies>> getMyMovies() async {
    try {
      final accessToken =
          await secureStorage.readData(EnvConfig.accessTokenKey);
      Response response = await httpClient.get(
        '/movies/my',
        headers: {
          "Authorization": "Bearer $accessToken",
        },
      );
      return Right(Movies.fromJson(response.data));
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }

  @override
  Future<Either<ErrorMsg, Movie>> getMovieDetail(String movieID) async {
    try {
      final accessToken =
          await secureStorage.readData(EnvConfig.accessTokenKey);
      Response response = await httpClient.get(
        '/movies/$movieID',
        headers: {
          "Authorization": "Bearer $accessToken",
        },
      );
      return Right(Movie.fromJson(response.data));
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }
}
