part of 'search_button_bloc.dart';

class SearchButtonState extends Equatable {
  int? numOfRank;
  String? dataToSearch;
  bool disabled;
  SearchButtonState({
    this.numOfRank,
    this.dataToSearch,
    this.disabled = true,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [numOfRank, dataToSearch, disabled];

  SearchButtonState copyWith({
    int? numOfRank,
    String? dataToSearch,
    bool? disabled,
  }) =>
      SearchButtonState(
        numOfRank: numOfRank ?? this.numOfRank,
        dataToSearch: dataToSearch ?? this.dataToSearch,
        disabled: disabled ?? this.disabled,
      );
}
