part of 'language_settings_bloc.dart';

abstract class LanguageSettingsEvent extends Equatable {
  const LanguageSettingsEvent();

  @override
  List<Object> get props => [];
}

class OnInit extends LanguageSettingsEvent {
  final Locale locale;
  const OnInit(this.locale);
}

class OnSelectedLocale extends LanguageSettingsEvent {
  final Locale selectedLocale;
  const OnSelectedLocale(this.selectedLocale);
}

class OnSaveLocale extends LanguageSettingsEvent {}
