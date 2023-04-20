part of 'languages_bloc.dart';

abstract class LanguagesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnChangeLanguage extends LanguagesEvent {
  final String countryCode;
  OnChangeLanguage(this.countryCode);
}
