import 'package:ai_data/features/ranking/data/model/ranking.dart';
import 'package:ai_data/features/ranking/helper/ranking_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ranking_event.dart';
part 'ranking_state.dart';

class RankingBloc extends Bloc<RankingEvent, RankingState> {
  RankingBloc() : super(const RankingState()) {
    on<OnInit>((event, emit) {
      List<RankingModel> listRanking = RankingHelper.formatResult(event.result);
      if (listRanking.isEmpty || listRanking.length < 3) {
        emit(state.copyWith(errorMessage: event.result));
      } else {
        emit(state.copyWith(listRanking: listRanking));
      }
    });
  }

  void init(String result) => add(OnInit(result));
}
