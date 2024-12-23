part of 'search_movies_bloc.dart';

sealed class SearchMoviesEvent extends Equatable {
  const SearchMoviesEvent();
  @override
  List<Object> get props => [];
}

class GetRecommendMovies extends SearchMoviesEvent {}

class SearchMovies extends SearchMoviesEvent {
  final String keyword;
  const SearchMovies(this.keyword);
}
