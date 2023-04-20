part of '../home.dart';

class _RankDropdown extends StatelessWidget {
  const _RankDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropdownBloc, DropdownState>(
      builder: (context, state) {
        return DropdownButton<int>(
          itemHeight: null,
          value: state.rankNumSelected,
          hint: const Text('Nº'),
          dropdownColor: AppColors.darkGrey,
          elevation: 1,
          underline: const SizedBox.shrink(),
          style: AppTextStyle.brandStyle,
          onChanged: (int? newValue) {
            context.read<DropdownBloc>().changeRank(newValue);
          },
          items: Constants.rankingNum.map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
        );
      },
    );
  }
}
