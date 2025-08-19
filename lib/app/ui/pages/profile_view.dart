import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_app/app/routes/app_router.dart';
import 'package:my_app/app/ui/widgets/layouts/basic_view_layout.dart';
import 'package:my_app/app/ui/widgets/tiles/menu_tile_item.dart';

@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return BasicViewLayout(
      headerTitle: '내정보',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Gap(deviceHeight * 0.01),
          MenuTile(
            title: '기본 정보',
            onTap: () {
              context.pushRoute(const BasicInformationRoute());
            },
          ),
          MenuDivider(),
          MenuTile(
            title: '비밀번호 설정',
            onTap: () {
              context.pushRoute(const SetPasswordRoute());
            },
          ),
          MenuDivider(),
          MenuTile(title: '관심 카테고리', onTap: () {}),
          MenuDivider(),
        ],
      ),
    );
  }
}
