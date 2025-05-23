import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(const SettingState()) {
    on<LocaleChanged>(onLocaleChanged);
  }

  void onLocaleChanged(
    LocaleChanged event,
    Emitter<SettingState> emit,
  ) async {
    emit(state.copyWith(locale: event.locale));
  }
}
