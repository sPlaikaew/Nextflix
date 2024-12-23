part of 'select_profile_bloc.dart';

class SelectProfileState extends Equatable {
  final bool loading;
  final bool isError;
  final String? errorMsg;
  final List<ProfileEntity>? profiles;

  const SelectProfileState({
    this.loading = true,
    this.isError = false,
    this.errorMsg,
    this.profiles,
  });

  SelectProfileState copyWith({
    bool? loading,
    bool? isError,
    String? errorMsg,
    List<ProfileEntity>? profiles,
  }) {
    return SelectProfileState(
      loading: loading ?? this.loading,
      isError: isError ?? this.isError,
      errorMsg: errorMsg ?? this.errorMsg,
      profiles: profiles ?? this.profiles,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        isError,
        errorMsg,
        profiles,
      ];
}
