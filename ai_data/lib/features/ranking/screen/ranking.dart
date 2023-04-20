import 'package:ai_data/core/app/service_locator/service_locator.dart';
import 'package:ai_data/core/app/styles/app_colors.dart';
import 'package:ai_data/core/app/styles/app_gradients.dart';
import 'package:ai_data/core/app/styles/app_space.dart';
import 'package:ai_data/core/app/styles/app_text_style.dart';
import 'package:ai_data/features/ranking/bloc/ranking_bloc.dart';
import 'package:ai_data/features/ranking/data/model/ranking.dart';
import 'package:ai_data/features/ranking/helper/ranking_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ranking extends StatelessWidget {
  final String result;
  const Ranking({
    super.key,
    required this.result,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<RankingBloc>()..init(result),
      child: const _RankingBody(),
    );
  }
}

class _RankingBody extends StatelessWidget {
  const _RankingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RankingBloc, RankingState>(
      builder: (context, state) {
        return Scaffold(
            body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: AppGradients.rankingColorGradient),
            ),
            const Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Opacity(
                  opacity: 0.2,
                  child: Image(
                      image: AssetImage(
                    'assets/gpt/gpt-logo.png',
                  ))),
            ),
            SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpaces.m,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: AppSpaces.xxl,
                      ),
                      if (state.errorMessage == null)
                        ...state.listRanking.map(
                          (rabking) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                rabking.name,
                                style: AppTextStyle.titleStyle,
                              ),
                              const SizedBox(
                                height: AppSpaces.s,
                              ),
                              Text(
                                rabking.info,
                                style: AppTextStyle.detailTextNormal,
                              ),
                              const Divider(color: AppColors.darkGrey),
                              const SizedBox(
                                height: AppSpaces.s,
                              ),
                            ],
                          ),
                        ),
                      if (state.errorMessage != null)
                        Text(
                          state.errorMessage!,
                          style: AppTextStyle.detailText500,
                        ),
                      const SizedBox(
                        height: AppSpaces.xxl,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: SafeArea(
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.darkGrey,
                  ),
                ),
              ),
            ),
          ],
        ));
      },
    );
  }
}
