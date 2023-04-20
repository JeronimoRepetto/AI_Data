part of 'data_to_search_bloc.dart';

abstract class DataToSearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnChangeData extends DataToSearchEvent {
  final String text;
  OnChangeData(this.text);
}
