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
                            return AppColors.naturalGrey;
                          }
                          return AppColors.primary;
                        },
                      ),
                    ),
                    onPressed: state.disabled
                        ? null
                        : () => searchButtonBloc.searchPrompt,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: AppSpaces.xl,
                          width: AppSpaces.xl,
                          child: Image(
                            image: AssetImage(
                              'assets/gpt/gpt-logo.png',
                            ),
                            color: AppColors.naturalGrey,
                          ),
                        ),
                        Text(
                          'home.search'.tr(),
                        ),
                        const SizedBox(
                          height: AppSpaces.xl,
                          width: AppSpaces.xl,
                          child: Image(
                            image: AssetImage(
                              'assets/gpt/gpt-logo.png',
                            ),
                            color: AppColors.naturalGrey,
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
