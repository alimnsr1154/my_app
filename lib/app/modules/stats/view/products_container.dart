import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_app/app/data/models/products.dart';
import 'package:my_app/app/ui/colors/colors.dart';
import 'package:my_app/app/ui/typography/typography.dart';

class ProductContainer extends StatelessWidget {
  final Product product;

  const ProductContainer({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.01),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(deviceWidth * 0.02),
            child: Image.asset(
              product.imageUrl,
              width: deviceWidth * 0.3,
              height: deviceHeight * 0.17,
              fit: BoxFit.cover,
            ),
          ),

          // Texts + Tags
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: deviceHeight * 0.01,
                horizontal: deviceWidth * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: AppTypography.text(context).sm.copyWith(
                      color: AppColors.primaryColors.grey[1200],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    product.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.text(
                      context,
                    ).sm.copyWith(color: AppColors.primaryColors.grey[1000]),
                  ),
                  Gap(deviceHeight * 0.05),

                  // Chips with NO spacing
                  Wrap(
                    spacing: deviceWidth * 0.02, // 👈 no horizontal space
                    runSpacing: 0, // 👈 no vertical space
                    children:
                        product.tags.map((tag) {
                          return Chip(
                            label: Text(
                              tag,
                              style: AppTypography.text(context).xxs.copyWith(
                                color: AppColors.primaryColors.primary[600],
                              ),
                            ),
                            backgroundColor:
                                AppColors.primaryColors.primary[50],
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap, // tighter
                            visualDensity:
                                VisualDensity.compact, // reduce padding
                            padding: EdgeInsets.zero,
                          );
                        }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
