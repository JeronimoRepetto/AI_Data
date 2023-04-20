part of '../home.dart';

class _LocationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocationSectionBloc locationSectionBloc =
        context.read<LocationSectionBloc>();
    return BlocBuilder<LocationSectionBloc, LocationSectionState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('home.inTheWorld'.tr(), style: AppTextStyle.brandStyle),
            Container(
              height: AppSpaces.xxl,
              width: AppFontSize.xxl,
              decoration: const BoxDecoration(
                color: AppColors.naturalGrey,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  //TODO OPEN MAP
                  String location = '';
                  locationSectionBloc.setLocation(location);
                },
                icon: const Icon(
                  Icons.map_outlined,
                  color: AppColors.darkGrey,
                ),
              ),
            ),
            const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
