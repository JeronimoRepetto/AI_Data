part of '../home.dart';

class _DataToSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DataToSearchBloc dataBloc = context.read<DataToSearchBloc>();
    return BlocBuilder<DataToSearchBloc, DataToSearchState>(
      bloc: dataBloc,
      builder: (context, state) {
        return TextFormField(
          controller: dataBloc.controller,
          focusNode: dataBloc.focusNode,
          style: AppTextStyle.brandStyle,
          textAlign: TextAlign.start,
          cursorColor: AppColors.darkGrey,
          onChanged: (text) {
            dataBloc.onChangeData(text);
          },
        );
      },
    );
  }
}
