part of 'ranking_bloc.dart';

class RankingState extends Equatable {
  final List<RankingModel> listRanking;
  final String? errorMessage;
  const RankingState({
    this.listRanking = const [],
    this.errorMessage,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        listRanking,
        errorMessage,
      ];

  RankingState copyWith({
    List<RankingModel>? listRanking,
    String? errorMessage,
  }) =>
      RankingState(
        listRanking: listRanking ?? this.listRanking,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
