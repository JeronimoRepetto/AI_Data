import 'package:ai_data/features/home/data/repository/gpt_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_button_event.dart';
part 'search_button_state.dart';

class SearchButtonBloc extends Bloc<SearchButtonEvent, SearchButtonState> {
  final GptRepository _gptRepository;
  SearchButtonBloc({
    required GptRepository gptRepository,
  })  : _gptRepository = gptRepository,
        super(const SearchButtonState()) {
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

    on<OnConnectWithGPT>((event, emit) {
      emit(
        state.copyWith(
          event: event,
        ),
      );
      _getChatGPTResult();
    });

    on<OnSetPrompt>((event, emit) {
      emit(
        state.copyWith(
          prompt: event.prompt,
          event: event,
        ),
      );
      add(OnConnectWithGPT());
    });

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

    on<OnError>(
      (event, emit) => emit(
        state.copyWith(
          event: event,
        ),
      ),
    );
  }

  void init() => add(OnInit());

  void setNumOfRank(int? numOfRank) => add(OnChangeRankNum(numOfRank));

  void setDataToSearch(String? dataToSearch) =>
      add(OnChangeDataToSearch(dataToSearch));

  void searchPrompt() {
    _generatePrompt();
  }

  void _generatePrompt() {
    final String prompt =
        '${'prompt.basicPrompt'.tr()} ${'prompt.top'.tr()} ${state.numOfRank} ${state.dataToSearch!.toLowerCase()} ${'prompt.in'.tr()} ${state.location ?? 'home.inTheWorld'.tr()}';
    add(OnSetPrompt(prompt));
  }

  Future<void> _getChatGPTResult() async {
    final result = await _gptRepository.getRanking(state.prompt!);
    result.fold(
      (failure) => add(OnError()),
      (success) {
        add(OnDone());
      },
    );
  }
}
