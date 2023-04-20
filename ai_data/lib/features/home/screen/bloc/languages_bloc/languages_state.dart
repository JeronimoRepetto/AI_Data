part of 'languages_bloc.dart';

class LanguagesState extends Equatable {
  final String? countryCodeSelected;
  const LanguagesState({this.countryCodeSelected});
  @override
  List<Object?> get props => [countryCodeSelected];

  LanguagesState copyWith({
    String? countryCodeSelected,
  }) =>
      LanguagesState(
        countryCodeSelected: countryCodeSelected ?? this.countryCodeSelected,
      );
}
