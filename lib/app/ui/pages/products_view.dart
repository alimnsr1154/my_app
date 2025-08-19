import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:my_app/app/modules/stats/view/products_container.dart';
import 'package:my_app/app/ui/colors/colors.dart';
import 'package:my_app/app/ui/widgets/layouts/basic_view_layout.dart';

import '../../modules/stats/controllers/products_controller.dart';

@RoutePage()
class ProductsView extends HookWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    final controller = Get.find<ProductsController>();

    final tabs = ["신청", "진행중", "완료"];

    return BasicViewLayout(
      headerTitle: '캠페인 매칭',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Gap(deviceHeight * 0.01),
          // Tabs
          TabBar(
            onTap: controller.changeTab,
            controller: useTabController(initialLength: tabs.length),
            labelColor: AppColors.primaryColors.grey[1200],
            unselectedLabelColor: AppColors.primaryColors.grey[800],

            // custom indicator with increased width
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                color: AppColors.primaryColors.primary[600]!,
                width: deviceWidth * 0.01, // thickness of the indicator
              ),
              insets: EdgeInsets.symmetric(horizontal: deviceWidth * 0.15),
            ),

            padding: EdgeInsets.zero,
            tabs: tabs.map((t) => Tab(text: t)).toList(),
          ),

          Gap(deviceHeight * 0.01),

          // Products List
          Expanded(
            child: Obx(() {
              final products = controller.products;
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductContainer(product: products[index]);
                },
              );
            }),
          ),
          // call container here
        ],
      ),
    );
  }
}
