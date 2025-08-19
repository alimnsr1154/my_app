import 'package:flutter/material.dart';
import 'package:my_app/app/ui/colors/colors.dart';
import 'package:my_app/app/ui/typography/typography.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final double? width;
  final double? height;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isEnabled = true,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      width: width ?? double.infinity,
      height: height ?? deviceHeight * 0.1,
      padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.02),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isEnabled
                  ? AppColors.primaryColors.primary[600]
                  : AppColors.primaryColors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(deviceWidth * 0.03),
          ),
        ),
        onPressed: isEnabled ? onPressed : null,
        child: Text(
          label,
          style: AppTypography.text(context).md.copyWith(
            color: AppColors.primaryColors.baseColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
