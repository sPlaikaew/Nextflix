import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/onboard_use_case.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final OnboardUseCase signInUseCase;
  SignInBloc(this.signInUseCase) : super(const SignInState()) {
    on<SignIn>(onSignIn);
  }

  Future<void> onSignIn(
    SignIn event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(
      loading: true,
    ));

    final response = await signInUseCase.signIn(event.email, event.password);

    response.fold(
      (left) {
        emit(state.copyWith(
          loading: false,
          isError: true,
          errorMsg: left.message,
        ));
      },
      (right) {
        if (right) {
          emit(state.copyWith(
            loading: false,
            isError: false,
          ));
        }
      },
    );
  }
}
