import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextflix/data/model/movies.dart';
import 'package:nextflix/domain/use_case/movies_use_case.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MoviesUseCase moviesUseCase;
  final String movieID;
  MovieDetailBloc(
    this.moviesUseCase,
    this.movieID,
  ) : super(const MovieDetailState()) {
    on<GetMovieDetail>(onGetMovieDetail);
  }

  Future<void> onGetMovieDetail(
      GetMovieDetail event, Emitter<MovieDetailState> emit) async {
    emit(state.copyWith(
      loading: true,
    ));

    final movieDetail = await moviesUseCase.getMovieDetail(movieID);

    movieDetail.fold(
      (left) {
        emit(state.copyWith(
          loading: false,
          isMovieDetailError: true,
          errorMsg: left.message,
        ));
      },
      (right) {
        emit(state.copyWith(
          loading: false,
          isMovieDetailError: false,
          movieDetail: right,
        ));
      },
    );
  }
}
