import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'languages_event.dart';
part 'languages_state.dart';

class LanguagesBloc extends Bloc<LanguagesEvent, LanguagesState> {
  LanguagesBloc() : super(LanguagesState()) {
    on<OnChangeLanguage>((event, emit) {
      if (state.countryCodeSelected != event.countryCode) {
        emit(
          state.copyWith(
            countryCodeSelected: event.countryCode,
          ),
        );
      }
    });
  }
  void setLanguage(String countryCode) => add(OnChangeLanguage(countryCode));
}
