import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nextflix/domain/use_case/movies_use_case.dart';
import 'package:nextflix/presentation/home/bloc/home_bloc.dart';
import 'package:nextflix/presentation/main/view/main_screen.dart';
import 'package:nextflix/presentation/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:nextflix/presentation/movie_detail/view/movie_detail_screen.dart';
import 'package:nextflix/presentation/search_movies/bloc/search_movies_bloc.dart';
import 'package:nextflix/presentation/search_movies/view/search_movies_screen.dart';
import 'package:nextflix/presentation/setting/bloc/setting_bloc.dart';

enum HomePageType {
  main,
  home,
  movieDetail,
  searchMovies,
}

extension HomeExtension on HomePageType {
  String toShortString() {
    return toString().split('.').last;
  }

  String get basePath {
    return HomeModule.baseRoute;
  }

  String get route {
    return "/${toShortString()}";
  }

  String get path {
    return "$basePath/${toShortString()}";
  }
}

class HomeModule extends Module {
  static const baseRoute = "/home";
  @override
  void routes(r) {
    r.child(
      HomePageType.main.route,
      child: (context) => MultiBlocProvider(providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(Modular.get<MoviesUseCase>())
            ..add(GetHighLightMovies())
            ..add(GetTrendMovies())
            ..add(GetMostWatchMovies())
            ..add(GetMyMovies()),
        ),
        BlocProvider<SettingBloc>(create: (context) => SettingBloc()),
      ], child: MainScreen(profile: r.args.data)),
    );
    r.child(
      HomePageType.movieDetail.route,
      child: (context) => BlocProvider(
        create: (context) => MovieDetailBloc(
          Modular.get<MoviesUseCase>(),
          r.args.data,
        )..add(GetMovieDetail()),
        child: const MovieDetailScreen(),
      ),
    );
    r.child(
      HomePageType.searchMovies.route,
      child: (context) => BlocProvider(
        create: (context) => SearchMoviesBloc(
          r.args.data,
        )..add(GetRecommendMovies()),
        child: const SearchMoviesScreen(),
      ),
    );
  }
}
