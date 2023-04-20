part of 'dropdown_bloc.dart';

abstract class DropdownEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnChange extends DropdownEvent {
  final int rankSelected;
  OnChange(this.rankSelected);
}

class OnResetRank extends DropdownEvent {}
