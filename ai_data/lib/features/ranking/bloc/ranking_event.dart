part of 'ranking_bloc.dart';

abstract class RankingEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnInit extends RankingEvent {
  final String result;
  OnInit(this.result);
}
