part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isHighLightMoviesLoading;
  final bool isTrendMoviesLoading;
  final bool isMustWatchMoviesLoading;
  final bool isMyMoviesLoading;
  final Movies? highLightMovies;
  final Movies? trendMovies;
  final Movies? mustWatchMovies;
  final Movies? myMovies;
  final bool isHighLightMoviesError;
  final bool isTrendMoviesError;
  final bool isMustWatchMoviesError;
  final bool isMyMoviesError;
  final String? errorMsg;

  const HomeState({
    this.isHighLightMoviesLoading = true,
    this.isTrendMoviesLoading = true,
    this.isMustWatchMoviesLoading = true,
    this.isMyMoviesLoading = true,
    this.highLightMovies,
    this.trendMovies,
    this.mustWatchMovies,
    this.myMovies,
    this.isHighLightMoviesError = false,
    this.isTrendMoviesError = false,
    this.isMustWatchMoviesError = false,
    this.isMyMoviesError = false,
    this.errorMsg,
  });

  HomeState copyWith({
    bool? isHighLightMoviesLoading,
    bool? isTrendMoviesLoading,
    bool? isMustWatchMoviesLoading,
    bool? isMyMoviesLoading,
    Movies? highLightMovies,
    Movies? trendMovies,
    Movies? mustWatchMovies,
    Movies? myMovies,
    bool? isHighLightMoviesError,
    bool? isTrendMoviesError,
    bool? isMustWatchMoviesError,
    bool? isMyMoviesError,
    String? errorMsg,
  }) {
    return HomeState(
      isHighLightMoviesLoading: isHighLightMoviesLoading ?? this.isHighLightMoviesLoading,
      isTrendMoviesLoading: isTrendMoviesLoading ?? this.isTrendMoviesLoading,
      isMustWatchMoviesLoading: isMustWatchMoviesLoading ?? this.isMustWatchMoviesLoading,
      isMyMoviesLoading: isMyMoviesLoading ?? this.isMyMoviesLoading,
      highLightMovies: highLightMovies ?? this.highLightMovies,
      trendMovies: trendMovies ?? this.trendMovies,
      mustWatchMovies: mustWatchMovies ?? this.mustWatchMovies,
      myMovies: myMovies ?? this.myMovies,
      isHighLightMoviesError: isHighLightMoviesError ?? this.isHighLightMoviesError,
      isTrendMoviesError: isTrendMoviesError ?? this.isTrendMoviesError,
      isMustWatchMoviesError: isMustWatchMoviesError ?? this.isMustWatchMoviesError,
      isMyMoviesError: isMyMoviesError ?? this.isMyMoviesError,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object?> get props => [
        isHighLightMoviesLoading,
        isTrendMoviesLoading,
        isMustWatchMoviesLoading,
        isMyMoviesLoading,
        highLightMovies,
        trendMovies,
        mustWatchMovies,
        myMovies,
        isHighLightMoviesError,
        isTrendMoviesError,
        isMustWatchMoviesError,
        isMyMoviesError,
        errorMsg,
      ];
}
