part of 'setting_bloc.dart';

sealed class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

class LocaleChanged extends SettingEvent {
  const LocaleChanged(this.locale);

  final Locale locale;
}
