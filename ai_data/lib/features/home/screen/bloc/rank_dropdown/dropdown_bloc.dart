import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dropdown_event.dart';
part 'dropdown_state.dart';

class DropdownBloc extends Bloc<DropdownEvent, DropdownState> {
  DropdownBloc() : super(const DropdownState()) {
    on<OnChange>(
      (event, emit) => emit(
        state.copyWith(
          rankNumSelected: event.rankSelected,
        ),
      ),
    );
    on<OnResetRank>(
      (event, emit) => emit(const DropdownState()),
    );
  }

  void changeRank(int? rankSelected) {
    if (rankSelected != null) {
      add(OnChange(rankSelected));
    } else {
      add(OnResetRank());
    }
  }
}
