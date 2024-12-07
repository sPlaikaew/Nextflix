import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nextflix/data/local/secure_storage.dart';
import 'package:nextflix/data/remote/http_client.dart';
import 'package:nextflix/data/repository/onboard_repo_impl.dart';
import 'package:nextflix/data/repository/movies_repo_impl.dart';
import 'package:nextflix/data/repository/profiles_repo_impl.dart';
import 'package:nextflix/domain/use_case/movies_use_case.dart';
import 'package:nextflix/domain/use_case/profiles_use_case.dart';
import 'package:nextflix/domain/use_case/onboard_use_case.dart';
import 'package:nextflix/injections/home.dart';
import 'package:nextflix/injections/onboard.dart';
import 'package:nextflix/presentation/setting/bloc/setting_bloc.dart';

class AppModule extends Module {
  final Dio dio;
  final FlutterSecureStorage flutterSecureStorage;
  final SecureStorage secureStorage;
  AppModule(this.dio, this.flutterSecureStorage, this.secureStorage);
  @override
  void binds(i) {
    i.addInstance<SecureStorage>(SecureStorage(flutterSecureStorage));
    i.addInstance<HttpClient>(HttpClient(dio, secureStorage));

    i.addSingleton<OnboardRepoImpl>(OnboardRepoImpl.new);
    i.addSingleton<ProfilesRepoImpl>(ProfilesRepoImpl.new);
    i.addSingleton<MoviesRepoImpl>(MoviesRepoImpl.new);

    i.addSingleton<OnboardUseCase>(OnboardUseCase.new);
    i.addSingleton<ProfilesUseCase>(ProfilesUseCase.new);
    i.addSingleton<MoviesUseCase>(MoviesUseCase.new);

    i.addSingleton<SettingBloc>(SettingBloc.new);
  }

  @override
  void routes(r) {
    r.module(
      OnboardModule.baseRoute,
      module: OnboardModule(),
    );
    r.module(
      HomeModule.baseRoute,
      module: HomeModule(),
    );
  }
}
