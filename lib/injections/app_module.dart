import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nextflix/data/data_sources/movies_data_source.dart';
import 'package:nextflix/data/data_sources/onboard_data_source.dart';
import 'package:nextflix/data/data_sources/profile_data_source.dart';
import 'package:nextflix/data/data_sources/secure_storage_data_source.dart';
import 'package:nextflix/domain/repository/movies_repo.dart';
import 'package:nextflix/data/local/secure_storage_access.dart';
import 'package:nextflix/data/local/secure_storage.dart';
import 'package:nextflix/data/remote/http_client.dart';
import 'package:nextflix/data/remote/http_request.dart';
import 'package:nextflix/data/repository/onboard_repo_impl.dart';
import 'package:nextflix/data/repository/movies_repo_impl.dart';
import 'package:nextflix/data/repository/profiles_repo_impl.dart';
import 'package:nextflix/domain/repository/onboard_repo.dart';
import 'package:nextflix/domain/repository/profiles_repo.dart';
import 'package:nextflix/domain/use_case/movies_use_case.dart';
import 'package:nextflix/domain/use_case/profiles_use_case.dart';
import 'package:nextflix/domain/use_case/onboard_use_case.dart';
import 'package:nextflix/injections/home.dart';
import 'package:nextflix/injections/onboard.dart';
import 'package:nextflix/presentation/setting/bloc/setting_bloc.dart';

class AppModule extends Module {
  final Dio dio;
  final SecureStorage secureStorage;
  AppModule(this.dio, this.secureStorage);
  @override
  void binds(i) {
    i.addInstance<SecureStorageAccess>(secureStorage);
    i.addInstance<HttpRequest>(HttpClient(dio, secureStorage));

    i.addSingleton<OnboardDataSource>(OnboardDataSource.new);
    i.addSingleton<SecureStorageDataSource>(SecureStorageDataSource.new);
    i.addSingleton<ProfileDataSource>(ProfileDataSource.new);
    i.addSingleton<MoviesDataSource>(MoviesDataSource.new);

    i.addSingleton<OnboardRepo>(OnboardRepoImpl.new);
    i.addSingleton<ProfilesRepo>(ProfilesRepoImpl.new);
    i.addSingleton<MoviesRepo>(MoviesRepoImpl.new);

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
