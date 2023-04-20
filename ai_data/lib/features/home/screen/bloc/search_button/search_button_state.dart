part of 'search_button_bloc.dart';

class SearchButtonState extends Equatable {
  final int? numOfRank;
  final String? dataToSearch;
  final bool disabled;
  final SearchButtonEvent? event;
  const SearchButtonState({
    this.numOfRank,
    this.dataToSearch,
    this.disabled = true,
    this.event,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [numOfRank, dataToSearch, disabled, event];

  SearchButtonState copyWith({
    int? numOfRank,
    String? dataToSearch,
    bool? disabled,
    SearchButtonEvent? event,
  }) =>
      SearchButtonState(
        numOfRank: numOfRank ?? this.numOfRank,
        dataToSearch: dataToSearch ?? this.dataToSearch,
        disabled: disabled ?? this.disabled,
        event: event ?? this.event,
      );
}
