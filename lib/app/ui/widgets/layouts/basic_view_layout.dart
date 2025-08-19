import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:my_app/app/ui/colors/colors.dart';
import 'package:my_app/app/ui/typography/typography.dart';
import 'package:my_app/app/ui/utils/assets.dart';

class BasicViewLayout extends StatelessWidget {
  final String headerTitle;
  final Color? backgroundColor;
  final Widget? child;
  final List<Widget>? children;
  final bool showBackButton;
  final Widget? suffixIcon;
  final VoidCallback? onBackButtonTap;
  final VoidCallback? onSuffixIconTap;
  final EdgeInsets? padding;
  final bool enableSafeArea;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  const BasicViewLayout({
    super.key,
    required this.headerTitle,
    this.backgroundColor,
    this.child,
    this.children,
    this.showBackButton = true,
    this.suffixIcon,
    this.onBackButtonTap,
    this.onSuffixIconTap,

    this.padding,
    this.enableSafeArea = true,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:
          backgroundColor ?? AppColors.primaryColors.baseColors.white,
      body: SafeArea(
        bottom: enableSafeArea,
        child: Column(
          children: [
            // Header Section
            _buildHeader(context),

            // Content Section
            Expanded(
              child: Container(
                padding:
                    padding ??
                    EdgeInsets.symmetric(horizontal: deviceWidth * 0.05),
                child:
                    child ??
                    Column(
                      crossAxisAlignment: crossAxisAlignment,
                      mainAxisAlignment: mainAxisAlignment,
                      children: children ?? [],
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Align(
      alignment: Alignment.topLeft, // forces everything to the left
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: deviceWidth * 0.05,
          vertical: deviceHeight * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // left alignment
          mainAxisSize: MainAxisSize.min, // shrink to content height
          children: [
            // Back Button
            if (showBackButton)
              GestureDetector(
                onTap: onBackButtonTap ?? () => Navigator.of(context).pop(),
                child: SvgPicture.asset(
                  Assets.icons.arrow,
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryColors.baseColors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),

            Gap(deviceHeight * 0.02),

            // Title below back button
            Text(
              headerTitle,
              style: AppTypography.display(context).sm.copyWith(
                color: AppColors.primaryColors.grey[1200],
                fontWeight: FontWeight.w600,
              ),
            ),

            // Optional suffix icon below title
            if (suffixIcon != null)
              GestureDetector(
                onTap: onSuffixIconTap,
                child: Container(
                  margin: EdgeInsets.only(top: deviceHeight * 0.01),
                  child: suffixIcon,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
