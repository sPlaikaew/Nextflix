import 'package:dio/dio.dart';
import 'package:nextflix/data/model/movies.dart';
import 'package:nextflix/data/remote/http_request.dart';

class MoviesDataSource {
  final HttpRequest httpRequest;
  MoviesDataSource(
    this.httpRequest,
  );

  Future<Movies> getHighLightMovies() async {
    Response response = await httpRequest.get('/movies/high-light');
    return Movies.fromJson(response.data);
  }

  Future<Movies> getTrendMovies() async {
    Response response = await httpRequest.get('/movies/trend');
    return Movies.fromJson(response.data);
  }

  Future<Movies> getMustWatchMovies() async {
    Response response = await httpRequest.get('/movies/must-watch');
    return Movies.fromJson(response.data);
  }

  Future<Movies> getMyMovies() async {
    Response response = await httpRequest.get('/movies/my');
    return Movies.fromJson(response.data);
  }

  Future<Movie> getMovieDetail(String movieID) async {
    Response response = await httpRequest.get('/movies/$movieID');
    return Movie.fromJson(response.data);
  }
}
