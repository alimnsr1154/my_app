import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:my_app/app/ui/colors/colors.dart';
import 'package:my_app/app/ui/typography/typography.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String placeholder;
  final bool isRequired;
  final String? suffixIconAsset;
  final VoidCallback? onSuffixIconTap;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;

  const CustomTextField({
    super.key,
    required this.title,
    required this.placeholder,
    this.isRequired = false,
    this.suffixIconAsset,
    this.onSuffixIconTap,
    this.controller,
    this.onChanged,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    final textColor =
        readOnly
            ? AppColors.primaryColors.grey[500]
            : AppColors.primaryColors.grey[1200];
    final backgroundColor =
        readOnly
            ? AppColors.primaryColors.grey[200]
            : AppColors.primaryColors.baseColors.white;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title with optional required asterisk
        RichText(
          text: TextSpan(
            text: title,
            style: AppTypography.text(context).sm.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColors.grey[1200],
            ),
            children: [
              if (isRequired)
                TextSpan(
                  text: ' *',
                  style: TextStyle(
                    color: AppColors.primaryColors.error[150],
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ),
        ),
        Gap(deviceHeight * 0.008),

        // Text Field
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(deviceWidth * 0.02),
            border: Border.all(
              color: AppColors.primaryColors.grey[200]!,
              width: 1,
            ),
          ),
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            enabled: enabled,
            readOnly: readOnly,
            maxLines: maxLines,
            style: AppTypography.text(context).sm.copyWith(color: textColor),
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: AppTypography.text(
                context,
              ).sm.copyWith(color: AppColors.primaryColors.grey[400]),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: deviceWidth * 0.04,
                vertical: deviceHeight * 0.015,
              ),
              suffixIcon:
                  suffixIconAsset != null
                      ? GestureDetector(
                        onTap: onSuffixIconTap,
                        child: Padding(
                          padding: EdgeInsets.all(deviceWidth * 0.03),
                          child: SvgPicture.asset(
                            suffixIconAsset!,
                            width: deviceWidth * 0.05,
                            height: deviceWidth * 0.05,
                            colorFilter: ColorFilter.mode(
                              AppColors.primaryColors.grey[1200]!,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      )
                      : null,
            ),
          ),
        ),
      ],
    );
  }
}
