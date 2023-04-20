import 'dart:async';

import 'package:ai_data/features/home/screen/bloc/rank_dropdown/dropdown_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'data_to_search_event.dart';
part 'data_to_search_state.dart';

class DataToSearchBloc extends Bloc<DataToSearchEvent, DataToSearchState> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final DropdownBloc _dropdownBloc;
  late StreamSubscription _dropdownSubscription;
  DataToSearchBloc({
    required DropdownBloc dropdownBloc,
  })  : _dropdownBloc = dropdownBloc,
        super(const DataToSearchState()) {
    _startSubscription();
    on<OnChangeData>(
      (event, emit) => emit(
        state.copyWith(
          textToSearch: event.text,
        ),
      ),
    );
  }

  void onChangeData(String text) {
    add(OnChangeData(text));
  }

  _startSubscription() {
    _dropdownBloc.stream.listen((state) {
      _canFocus();
    });
  }

  _canFocus() {
    if (state.textToSearch != null && controller.text.isNotEmpty) return;
    focusNode.requestFocus();
  }

  @override
  Future<void> close() {
    _dropdownSubscription.cancel();
    return super.close();
  }
}
