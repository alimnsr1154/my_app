import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:my_app/app/ui/colors/colors.dart';
import 'package:my_app/app/ui/typography/typography.dart';
import 'package:my_app/app/ui/utils/assets.dart';

class MenuTile extends StatelessWidget {
  final String? icon;
  final String title;
  final VoidCallback onTap;

  const MenuTile({
    super.key,
    this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: deviceWidth * 0.04,
          vertical: deviceHeight * 0.025,
        ),
        child: Row(
          children: [
            if (icon != null) SvgPicture.asset(icon!),
            Gap(deviceWidth * 0.01),
            Expanded(
              child: Text(
                title,
                style: AppTypography.text(context).sm.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColors.grey[1200],
                ),
              ),
            ),
            SvgPicture.asset(Assets.icons.arrowRight),
          ],
        ),
      ),
    );
  }
}

class MenuDivider extends StatelessWidget {
  const MenuDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: AppColors.primaryColors.grey[200],
    );
  }
}
