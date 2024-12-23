part of 'setting_bloc.dart';

class SettingState extends Equatable {
  const SettingState({
    this.locale = const Locale("en"),
  });

  final Locale locale;

  SettingState copyWith({
    Locale? locale,
  }) {
    return SettingState(
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object> get props => [locale];
}
