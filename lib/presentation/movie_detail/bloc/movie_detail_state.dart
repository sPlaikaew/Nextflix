part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  final bool loading;
  final bool isMovieDetailError;
  final String? errorMsg;
  final Movie? movieDetail;

  const MovieDetailState({
    this.loading = true,
    this.isMovieDetailError = false,
    this.errorMsg,
    this.movieDetail,
  });

  MovieDetailState copyWith({
    bool? loading,
    bool? isMovieDetailError,
    String? errorMsg,
    Movie? movieDetail,
  }) {
    return MovieDetailState(
      loading: loading ?? this.loading,
      isMovieDetailError: isMovieDetailError ?? this.isMovieDetailError,
      errorMsg: errorMsg ?? this.errorMsg,
      movieDetail: movieDetail ?? this.movieDetail,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        isMovieDetailError,
        errorMsg,
        movieDetail,
      ];
}
