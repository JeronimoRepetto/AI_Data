import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'search_button_event.dart';
part 'search_button_state.dart';

class SearchButtonBloc extends Bloc<SearchButtonEvent, SearchButtonState> {
  SearchButtonBloc() : super(SearchButtonState()) {
    on<OnChangeRankNum>(
      (event, emit) {
        emit(
          state.copyWith(
            numOfRank: event.numOfRank,
          ),
        );
        add(OnCheckForm());
      },
    );

    on<OnChangeDataToSearch>(
      (event, emit) {
        emit(
          state.copyWith(
            dataToSearch: event.dataToSearch,
          ),
        );
        add(OnCheckForm());
      },
    );

    on<OnCheckForm>(
      (event, emit) => emit(
        state.copyWith(
          disabled: state.dataToSearch == null ||
              state.dataToSearch!.isEmpty ||
              state.numOfRank == null,
        ),
      ),
    );
  }

  void setNumOfRank(int? numOfRank) => add(OnChangeRankNum(numOfRank));
  void setDataToSearch(String? dataToSearch) =>
      add(OnChangeDataToSearch(dataToSearch));

  void searchPrompt() {}
}
