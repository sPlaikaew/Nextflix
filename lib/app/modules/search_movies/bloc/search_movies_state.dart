part of 'search_movies_bloc.dart';

class SearchMoviesState extends Equatable {
  final bool loading;
  final List<Movie>? movies;

  const SearchMoviesState({
    this.loading = true,
    this.movies,
  });

  SearchMoviesState copyWith({
    bool? loading,
    List<Movie>? movies,
  }) {
    return SearchMoviesState(
      loading: loading ?? this.loading,
      movies: movies ?? this.movies,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        movies,
      ];
}
