import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nextflix/data/local/secure_storage.dart';
import 'package:nextflix/injections/app_module.dart';
import 'package:nextflix/injections/onboard.dart';
import 'package:nextflix/localization/app_localization.dart';
import 'package:nextflix/presentation/setting/bloc/setting_bloc.dart';
import 'package:nextflix/utils/env/env_config.dart';
import 'package:nextflix/utils/themes/color.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  Modular.setInitialRoute(OnboardPageType.login.path);
  final apiClient = createApiClient(EnvConfig.baseURL);
  const flutterSecureStorage = FlutterSecureStorage();
  final secureStorage = SecureStorage(flutterSecureStorage);
  runApp(
    ModularApp(
      module: AppModule(
        apiClient,
        flutterSecureStorage,
        secureStorage,
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    EasyLoading.instance
      ..userInteractions = false
      ..maskType = EasyLoadingMaskType.black;

    final locale = context.watch<SettingBloc>((bloc) => bloc.stream);

    return MaterialApp.router(
      title: 'NextFlix',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: NextFlixColor.primary),
        useMaterial3: true,
      ),
      builder: EasyLoading.init(),
      routerConfig: Modular.routerConfig,
      locale: locale.state.locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

Dio createApiClient(
  String baseURL,
) {
  final dio = Dio()
    ..options.baseUrl = baseURL
    ..options.connectTimeout = const Duration(seconds: 60)
    ..options.receiveTimeout = const Duration(seconds: 60);
  return dio;
}
