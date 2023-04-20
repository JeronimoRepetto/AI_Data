part of 'language_settings_bloc.dart';

class LanguageSettingsState extends Equatable {
  final Locale? locale;
  final Locale? initialLocale;
  const LanguageSettingsState({this.locale, this.initialLocale});

  @override
  List<Object?> get props => [locale, initialLocale];

  LanguageSettingsState copyWith({
    Locale? locale,
    Locale? initialLocale,
  }) =>
      LanguageSettingsState(
        locale: locale ?? this.locale,
        initialLocale: initialLocale ?? this.initialLocale,
      );
}
