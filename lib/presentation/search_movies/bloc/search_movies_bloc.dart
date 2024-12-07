import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextflix/data/model/movies.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final List<Movie> movies;
  SearchMoviesBloc(this.movies) : super(const SearchMoviesState()) {
    on<SearchMovies>(onSearchMovies);
    on<GetRecommendMovies>(onGetRecommendMovies);
  }

  void onGetRecommendMovies(
    GetRecommendMovies event,
    Emitter<SearchMoviesState> emit,
  ) {
    emit(state.copyWith(
      loading: true,
    ));

    emit(state.copyWith(
      loading: false,
      movies: movies,
    ));
  }

  void onSearchMovies(
    SearchMovies event,
    Emitter<SearchMoviesState> emit,
  ) {
    List<Movie> result = [];
    if (event.keyword.isEmpty) {
      result = movies;
    } else {
      result = movies
          .where((user) =>
              user.name.toLowerCase().contains(event.keyword.toLowerCase()))
          .toList();
    }
    emit(state.copyWith(
      movies: result,
    ));
  }
}
