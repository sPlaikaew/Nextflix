import 'package:either_dart/either.dart';
import 'package:nextflix/data/model/error_msg.dart';
import 'package:nextflix/data/model/movies.dart';

abstract class MoviesRepo {
  Future<Either<ErrorMsg, Movies>> getHighLightMovies();
  Future<Either<ErrorMsg, Movies>> getTrendMovies();
  Future<Either<ErrorMsg, Movies>> getMustWatchMovies();
  Future<Either<ErrorMsg, Movies>> getMyMovies();
  Future<Either<ErrorMsg, Movie>> getMovieDetail(String movieID);
}
