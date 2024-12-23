import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextflix/app/domain/entities/profile_entity.dart';

import '../../../data/model/profile.dart';
import '../../../domain/use_case/profiles_use_case.dart';

part 'select_profile_event.dart';
part 'select_profile_state.dart';

class SelectProfileBloc extends Bloc<SelectProfileEvent, SelectProfileState> {
  final ProfilesUseCase profileUseCase;
  SelectProfileBloc(this.profileUseCase) : super(const SelectProfileState()) {
    on<GetAllProfiles>(onGetAllProfiles);
  }

  Future<void> onGetAllProfiles(
    GetAllProfiles event,
    Emitter<SelectProfileState> emit,
  ) async {
    emit(state.copyWith(
      loading: true,
    ));

    final profiles = await profileUseCase.getAllProfiles();

    profiles.fold(
      (left) {
        emit(state.copyWith(
          loading: false,
          isError: true,
          errorMsg: left.message,
        ));
      },
      (right) {
        emit(state.copyWith(
          loading: false,
          isError: false,
          profiles: right,
        ));
      },
    );
  }
}
