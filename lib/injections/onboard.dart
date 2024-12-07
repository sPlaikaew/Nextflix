import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nextflix/domain/use_case/profiles_use_case.dart';
import 'package:nextflix/domain/use_case/onboard_use_case.dart';
import 'package:nextflix/presentation/select_profile/bloc/select_profile_bloc.dart';
import 'package:nextflix/presentation/select_profile/view/select_profile_screen.dart';
import 'package:nextflix/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:nextflix/presentation/sign_in/view/sign_in_screen.dart';

enum OnboardPageType {
  login,
  selectProfile,
}

extension OnboardPageExtension on OnboardPageType {
  String toShortString() {
    return toString().split('.').last;
  }

  String get basePath {
    return OnboardModule.baseRoute;
  }

  String get route {
    return "/${toShortString()}";
  }

  String get path {
    return "$basePath/${toShortString()}";
  }
}

class OnboardModule extends Module {
  static const baseRoute = "/onboard";
  @override
  void routes(r) {
    r.child(
      OnboardPageType.login.route,
      child: (context) => BlocProvider(
        create: (context) => SignInBloc(Modular.get<OnboardUseCase>()),
        child: const SignInScreen(),
      ),
    );
    r.child(
      OnboardPageType.selectProfile.route,
      child: (context) => BlocProvider(
        create: (context) => SelectProfileBloc(Modular.get<ProfilesUseCase>())
        ..add(GetAllProfiles()),
        child: const SelectProfileScreen(),
      ),
    );
  }
}
