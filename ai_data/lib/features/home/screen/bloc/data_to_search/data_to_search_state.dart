part of 'data_to_search_bloc.dart';

class DataToSearchState extends Equatable {
  final String? textToSearch;
  const DataToSearchState({this.textToSearch});
  @override
  // TODO: implement props
  List<Object?> get props => [textToSearch];

  DataToSearchState copyWith({String? textToSearch}) => DataToSearchState(
        textToSearch: textToSearch ?? this.textToSearch,
      );
}
