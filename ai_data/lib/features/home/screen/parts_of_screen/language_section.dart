part of '../home.dart';

class _LanguageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: AppSpaces.m,
      right: AppSpaces.m,
      child: SafeArea(
        child: BlocBuilder<LanguagesBloc, LanguagesState>(
          builder: (context, state) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ...L10n.all.toList().map(
                      (locale) => InkWell(
                        onTap: () => locator<LanguagesBloc>().setLanguage(
                          locale.countryCode ?? 'EN',
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpaces.s,
                          ),
                          child: Container(
                            height: AppFontSize.xl,
                            width: AppFontSize.xl,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                AppSpaces.s,
                              ),
                              color: state.countryCodeSelected ==
                                      locale.countryCode
                                  ? Colors.black54
                                  : Colors.transparent,
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/countries_flags/${locale.countryCode!.toUpperCase()}.png',
                                ),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
              ],
            );
          },
        ),
      ),
    );
  }
}
