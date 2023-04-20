import 'dart:ui';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_settings_event.dart';
part 'language_settings_state.dart';

class LanguageSettingsBloc
    extends Bloc<LanguageSettingsEvent, LanguageSettingsState> {
  LanguageSettingsBloc() : super(const LanguageSettingsState()) {
    on<OnInit>(
      (event, emit) => emit(
        state.copyWith(
          initialLocale: event.locale,
          locale: event.locale,
        ),
      ),
    );
    on<OnSelectedLocale>(
      (event, emit) => emit(
        state.copyWith(
          locale: event.selectedLocale,
        ),
      ),
    );

    on<OnSaveLocale>((event, emit) {
      // TODO: implement event handler
    });
  }

  void init(Locale locale) => add(OnInit(locale));

  void selectedLocale(Locale selectedLocale) =>
      add(OnSelectedLocale(selectedLocale));
}
