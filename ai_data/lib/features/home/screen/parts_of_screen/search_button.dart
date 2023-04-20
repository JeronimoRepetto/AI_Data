part of '../home.dart';

class _SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SearchButtonBloc searchButtonBloc = locator<SearchButtonBloc>();
    return Positioned(
        bottom: 10,
        right: 0,
        left: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpaces.m),
          child: SafeArea(
            child: BlocBuilder<SearchButtonBloc, SearchButtonState>(
              bloc: searchButtonBloc,
              builder: (context, state) {
                return MultiBlocListener(
                  listeners: [
                    BlocListener<DropdownBloc, DropdownState>(
                      listener: (context, state) {
                        searchButtonBloc.setNumOfRank(state.rankNumSelected);
                      },
                    ),
                    BlocListener<DataToSearchBloc, DataToSearchState>(
                      listener: (context, state) {
                        searchButtonBloc.setDataToSearch(state.textToSearch);
                      },
                    ),
                  ],
                  child: FilledButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {
                            return AppColors.neutralLightBack;
                          }
                          return AppColors.primary;
                        },
                      ),
                    ),
                    onPressed: state.disabled
                        ? null
                        : () {
                            searchButtonBloc.searchPrompt();
                          },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: AppSpaces.xl,
                          width: AppSpaces.xl,
                          child: Image(
                            image: const AssetImage(
                              'assets/gpt/gpt-logo.png',
                            ),
                            color: state.disabled
                                ? AppColors.neutralLightBack
                                : AppColors.naturalGrey,
                          ),
                        ),
                        Text(
                          'home.search'.tr(),
                          style: AppTextStyle.detailText500.copyWith(
                            color: AppColors.naturalGrey,
                          ),
                        ),
                        SizedBox(
                          height: AppSpaces.xl,
                          width: AppSpaces.xl,
                          child: Image(
                            image: const AssetImage(
                              'assets/gpt/gpt-logo.png',
                            ),
                            color: state.disabled
                                ? AppColors.neutralLightBack
                                : AppColors.naturalGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
