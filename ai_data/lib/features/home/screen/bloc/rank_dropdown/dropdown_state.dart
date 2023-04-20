part of 'dropdown_bloc.dart';

class DropdownState extends Equatable {
  final int? rankNumSelected;

  const DropdownState({
    this.rankNumSelected,
  });

  @override
  List<Object?> get props => [rankNumSelected];

  DropdownState copyWith({int? rankNumSelected}) => DropdownState(
        rankNumSelected: rankNumSelected ?? this.rankNumSelected,
      );
}
