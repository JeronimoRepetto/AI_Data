part of 'search_button_bloc.dart';

class SearchButtonState extends Equatable {
  final int? numOfRank;
  final String? dataToSearch;
  final String? location;
  final bool disabled;
  final String? prompt;
  final SearchButtonEvent? event;
  const SearchButtonState({
    this.numOfRank,
    this.dataToSearch,
    this.location,
    this.disabled = true,
    this.event,
    this.prompt,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [numOfRank, dataToSearch, disabled, event, prompt];

  SearchButtonState copyWith({
    int? numOfRank,
    String? dataToSearch,
    String? location,
    bool? disabled,
    SearchButtonEvent? event,
    String? prompt,
  }) =>
      SearchButtonState(
        numOfRank: numOfRank ?? this.numOfRank,
        dataToSearch: dataToSearch ?? this.dataToSearch,
        location: location ?? this.location,
        disabled: disabled ?? this.disabled,
        event: event ?? this.event,
        prompt: prompt ?? this.prompt,
      );
}
