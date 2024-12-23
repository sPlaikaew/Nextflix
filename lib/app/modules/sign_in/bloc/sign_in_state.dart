part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final bool loading;
  final bool isError;
  final String? errorMsg;

  const SignInState({
    this.loading = true,
    this.isError = false,
    this.errorMsg,
  });

  SignInState copyWith({
    bool? loading,
    bool? isError,
    String? errorMsg,
  }) {
    return SignInState(
      loading: loading ?? this.loading,
      isError: isError ?? this.isError,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        isError,
        errorMsg,
      ];
}
