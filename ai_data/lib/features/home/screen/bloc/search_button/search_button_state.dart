part of 'search_button_bloc.dart';

class SearchButtonState extends Equatable {
  final int? numOfRank;
  final String? dataToSearch;
  final bool disabled;
  final String? prompt;
  final String? result;
  final SearchButtonEvent? event;
  const SearchButtonState({
    this.numOfRank,
    this.dataToSearch,
    this.disabled = true,
    this.event,
    this.result,
    this.prompt,
  });
  @override
  List<Object?> get props =>
      [numOfRank, dataToSearch, disabled, event, result, prompt];

  SearchButtonState copyWith({
    int? numOfRank,
    String? dataToSearch,
    bool? disabled,
    SearchButtonEvent? event,
    String? result,
    String? prompt,
  }) =>
      SearchButtonState(
        numOfRank: numOfRank ?? this.numOfRank,
        dataToSearch: dataToSearch ?? this.dataToSearch,
        disabled: disabled ?? this.disabled,
        event: event ?? this.event,
        result: result ?? this.result,
        prompt: prompt ?? this.prompt,
      );
}
