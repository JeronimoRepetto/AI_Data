import 'package:ai_data/core/app/constants/global_constants.dart';
import 'package:ai_data/core/app/service_locator/service_locator.dart';
import 'package:ai_data/core/app/styles/app_colors.dart';
import 'package:ai_data/core/app/styles/app_font_size.dart';
import 'package:ai_data/core/app/styles/app_gradients.dart';
import 'package:ai_data/core/app/styles/app_space.dart';
import 'package:ai_data/core/app/styles/app_text_style.dart';
import 'package:ai_data/core/routing/app_routing.dart';
import 'package:ai_data/features/home/screen/bloc/data_to_search/data_to_search_bloc.dart';
import 'package:ai_data/features/home/screen/bloc/rank_dropdown/dropdown_bloc.dart';
import 'package:ai_data/features/home/screen/bloc/search_button/search_button_bloc.dart';
import 'package:ai_data/widgets/custom_alert_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'parts_of_screen/rank_dropdown.dart';
part 'parts_of_screen/data_to_search.dart';
part 'parts_of_screen/search_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<DropdownBloc>(),
        ),
        BlocProvider(
          create: (context) => locator<DataToSearchBloc>(),
        ),
        BlocProvider(
          create: (context) => locator<SearchButtonBloc>()..init(),
        ),
      ],
      child: Scaffold(
        body: BlocListener<SearchButtonBloc, SearchButtonState>(
          listener: (context, state) {
            switch (state.event.runtimeType) {
              case OnConnectWithGPT:
                showDialog(
                  useSafeArea: true,
                  context: context,
                  builder: (context) => CustomAlertDialog(
                    title: 'home.popup.title'.tr(),
                    titleStyle: AppTextStyle.simpleTextBold.copyWith(
                      color: AppColors.secondaryGradient,
                    ),
                    content: 'home.popup.message'.tr(),
                    contentStyle: AppTextStyle.detailTextNormal,
                    imageSrc: 'assets/gpt/gpt-logo.png',
                    imgColor: AppColors.primary,
                    useOnWillPop: false,
                  ),
                );
                break;
              case OnDone:
                Navigator.pop(context);
                break;
              case OnHaveResult:
                goRouter.pushNamed('ranking', extra: state.result);
                break;
              case OnError:
                Navigator.pop(context);
                break;
              default:
                break;
            }
          },
          child: Stack(
            children: [
              const _HomeForm(),
              _SearchButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeForm extends StatelessWidget {
  const _HomeForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: AppGradients.primaryColorGradient,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppFontSize.m,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _TopAndNumberSection(),
              _DataToSearch(),
              _LocationSection()
            ],
          ),
        ),
      ),
    );
  }
}

class _TopAndNumberSection extends StatelessWidget {
  const _TopAndNumberSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'home.top'.tr(),
          style: AppTextStyle.brandStyle,
        ),
        const SizedBox(
          width: AppSpaces.m,
        ),
        const _RankDropdown(),
      ],
    );
  }
}

class _LocationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('home.inBarcelona'.tr(), style: AppTextStyle.brandStyle);
  }
}
