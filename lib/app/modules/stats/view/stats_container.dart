// Stats Container Widget
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:my_app/app/modules/stats/controllers/stats_controller.dart';
import 'package:my_app/app/ui/colors/colors.dart';
import 'package:my_app/app/ui/typography/typography.dart';
import 'package:my_app/app/ui/utils/assets.dart';

class StatsContainer extends StatelessWidget {
  const StatsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final controller = Get.find<StatsController>();

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: deviceHeight * 0.02,
        horizontal: deviceWidth * 0.04,
      ),
      color: AppColors.primaryColors.grey[25],
      decoration: BoxDecoration(
        color: AppColors.primaryColors.baseColors.white,
        borderRadius: BorderRadius.circular(deviceWidth * 0.03),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColors.grey[200]!,
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '나의 택배현황',
                style: AppTypography.display(context).xxxs.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColors.grey[1200]!,
                ),
              ),
              SvgPicture.asset(Assets.icons.arrowRight),
            ],
          ),
          Gap(deviceHeight * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildStatItem(context, controller.applied, '신청'),
              SvgPicture.asset(
                Assets.icons.arrowRight,
                colorFilter: ColorFilter.mode(
                  AppColors.primaryColors.grey[400]!,
                  BlendMode.srcIn,
                ),
              ),
              buildStatItem(context, controller.inProgress, '진행중'),
              SvgPicture.asset(
                Assets.icons.arrowRight,
                colorFilter: ColorFilter.mode(
                  AppColors.primaryColors.grey[400]!,
                  BlendMode.srcIn,
                ),
              ),
              buildStatItem(context, controller.completed, '완료'),
            ],
          ),
        ],
      ),
    );
  }
}

Widget buildStatItem(BuildContext context, RxInt count, String label) {
  final deviceHeight = MediaQuery.of(context).size.height;
  return Column(
    children: [
      Obx(
        () => Text(
          count.value.toString(),
          style: AppTypography.display(context).xs.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColors.primary[600],
          ),
        ),
      ),
      Gap(deviceHeight * 0.01),
      Text(
        label,
        style: AppTypography.text(context).sm.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.primaryColors.grey[1200],
        ),
      ),
    ],
  );
}
