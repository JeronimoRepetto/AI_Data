part of 'search_button_bloc.dart';

abstract class SearchButtonEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnInit extends SearchButtonEvent {}

class OnChangeRankNum extends SearchButtonEvent {
  final int? numOfRank;
  OnChangeRankNum(this.numOfRank);
}

class OnChangeDataToSearch extends SearchButtonEvent {
  final String? dataToSearch;
  OnChangeDataToSearch(this.dataToSearch);
}

class OnCheckForm extends SearchButtonEvent {}

class OnConnectWithGPT extends SearchButtonEvent {}

class OnSetPrompt extends SearchButtonEvent {
  final String prompt;
  OnSetPrompt(this.prompt);
}

class OnDone extends SearchButtonEvent {}

class OnError extends SearchButtonEvent {}
