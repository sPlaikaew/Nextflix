import 'package:either_dart/either.dart';

import '../../data/model/error_msg.dart';
import '../../data/model/movies.dart';
import '../repository/movies_repo.dart';

class MoviesUseCase {
  final MoviesRepo moviesRepo;
  MoviesUseCase(this.moviesRepo);
  Future<Either<ErrorMsg, Movies>> getHighLightMovies() async {
    final highLightMovies = await moviesRepo.getHighLightMovies();
    return highLightMovies;
  }

  Future<Either<ErrorMsg, Movies>> getTrendMovies() async {
    final trendMovies = await moviesRepo.getTrendMovies();
    return trendMovies;
  }

  Future<Either<ErrorMsg, Movies>> getMustWatchMovies() async {
    final mustWatchMovies = await moviesRepo.getMustWatchMovies();
    return mustWatchMovies;
  }

  Future<Either<ErrorMsg, Movies>> getMyMovies() async {
    final mustWatchMovies = await moviesRepo.getMyMovies();
    return mustWatchMovies;
  }

  Future<Either<ErrorMsg, Movie>> getMovieDetail(String movieID) async {
    final movieDetail = await moviesRepo.getMovieDetail(movieID);
    return movieDetail;
  }
}
