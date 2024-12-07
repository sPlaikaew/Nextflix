part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class GetHighLightMovies extends HomeEvent {}

class GetTrendMovies extends HomeEvent {}

class GetMostWatchMovies extends HomeEvent {}

class GetMyMovies extends HomeEvent {}



