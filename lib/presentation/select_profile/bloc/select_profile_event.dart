part of 'select_profile_bloc.dart';

sealed class SelectProfileEvent extends Equatable {
  const SelectProfileEvent();
  @override
  List<Object> get props => [];
}

class GetAllProfiles extends SelectProfileEvent {}
