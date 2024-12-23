import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/movies.dart';
import '../../../domain/use_case/movies_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MoviesUseCase moviesUseCase;
  HomeBloc(this.moviesUseCase) : super(const HomeState()) {
    on<GetHighLightMovies>(onGetHighLightMovies);
    on<GetTrendMovies>(onGetTrendMovies);
    on<GetMostWatchMovies>(onGetMustWatchMovies);
    on<GetMyMovies>(onGetMyMovies);
  }

  Future<void> onGetHighLightMovies(
    GetHighLightMovies event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      isHighLightMoviesLoading: true,
    ));

    final highLightMovies = await moviesUseCase.getHighLightMovies();

    highLightMovies.fold(
      (left) {
        emit(state.copyWith(
          isHighLightMoviesLoading: false,
          isHighLightMoviesError: true,
          errorMsg: left.message,
        ));
      },
      (right) {
        emit(state.copyWith(
          isHighLightMoviesLoading: false,
          isHighLightMoviesError: false,
          highLightMovies: right,
        ));
      },
    );
  }

  Future<void> onGetTrendMovies(
    GetTrendMovies event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      isTrendMoviesLoading: true,
    ));

    final trendMovies = await moviesUseCase.getTrendMovies();

    trendMovies.fold(
      (left) {
        emit(state.copyWith(
          isTrendMoviesLoading: false,
          isTrendMoviesError: true,
          errorMsg: left.message,
        ));
      },
      (right) {
        emit(state.copyWith(
          isTrendMoviesLoading: false,
          isTrendMoviesError: false,
          trendMovies: right,
        ));
      },
    );
  }

  Future<void> onGetMustWatchMovies(
    GetMostWatchMovies event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      isMustWatchMoviesLoading: true,
    ));

    final mustWatchMovies = await moviesUseCase.getMustWatchMovies();

    mustWatchMovies.fold(
      (left) {
        emit(state.copyWith(
          isMustWatchMoviesLoading: false,
          isMustWatchMoviesError: true,
          errorMsg: left.message,
        ));
      },
      (right) {
        emit(state.copyWith(
          isMustWatchMoviesLoading: false,
          isMustWatchMoviesError: false,
          mustWatchMovies: right,
        ));
      },
    );
  }

  Future<void> onGetMyMovies(
    GetMyMovies event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      isMyMoviesLoading: true,
    ));

    final myMovies = await moviesUseCase.getMyMovies();

    myMovies.fold(
      (left) {
        emit(state.copyWith(
          isMyMoviesLoading: false,
          isMyMoviesError: true,
          errorMsg: left.message,
        ));
      },
      (right) {
        emit(state.copyWith(
          isMyMoviesLoading: false,
          isMyMoviesError: false,
          myMovies: right,
        ));
      },
    );
  }
}
