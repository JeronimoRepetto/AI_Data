import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_button_event.dart';
part 'search_button_state.dart';

class SearchButtonBloc extends Bloc<SearchButtonEvent, SearchButtonState> {
  SearchButtonBloc() : super(const SearchButtonState()) {
    on<OnInit>(
      (event, emit) => emit(
        state.copyWith(
          event: event,
        ),
      ),
    );

    on<OnChangeRankNum>(
      (event, emit) {
        emit(
          state.copyWith(
            event: event,
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
            event: event,
            dataToSearch: event.dataToSearch,
          ),
        );
        add(OnCheckForm());
      },
    );

    on<OnCheckForm>(
      (event, emit) => emit(
        state.copyWith(
          event: event,
          disabled: state.dataToSearch == null ||
              state.dataToSearch!.isEmpty ||
              state.numOfRank == null,
        ),
      ),
    );
    on<OnConnectWithGPT>(
      (event, emit) => emit(
        state.copyWith(
          event: event,
        ),
      ),
    );

    on<OnDone>(
      (event, emit) {
        emit(
          state.copyWith(
            event: event,
          ),
        );
        add(OnInit());
      },
    );
  }

  void init() => add(OnInit());

  void setNumOfRank(int? numOfRank) => add(OnChangeRankNum(numOfRank));

  void setDataToSearch(String? dataToSearch) =>
      add(OnChangeDataToSearch(dataToSearch));

  Future<void> searchPrompt() async {
    add(OnConnectWithGPT());
    await Future.delayed(
      Duration(
        seconds: 3,
      ),
    );
    add(OnDone());
  }
}
