import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:my_app/app/routes/app_router.dart';
import 'package:my_app/app/ui/utils/assets.dart';
import 'package:my_app/app/ui/widgets/layouts/basic_view_layout.dart';
import 'package:my_app/app/ui/widgets/tiles/menu_tile_item.dart';
import 'package:my_app/app/modules/stats/view/stats_container.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return BasicViewLayout(
      headerTitle: '안녕하세요, \n 홍길동님',
      suffixIcon: SvgPicture.asset(Assets.icons.btnUploading),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Gap(deviceHeight * 0.01),
          InkWell(
            child: StatsContainer(),
            onTap: () {
              context.pushRoute(const ProductsRoute());
            },
          ),
          Gap(deviceHeight * 0.02),
          MenuTile(
            icon: Assets.icons.user,
            title: ' 내 정보',
            onTap: () {
              context.pushRoute(const ProfileRoute());
            },
          ),
          MenuDivider(),
          MenuTile(icon: Assets.icons.messages, title: '공지사항', onTap: () {}),
          MenuDivider(),
          MenuTile(
            icon: Assets.icons.messageQuestion,
            title: '1:1문의',
            onTap: () {},
          ),
          MenuDivider(),
          MenuTile(icon: Assets.icons.note, title: 'FAQ', onTap: () {}),
          MenuDivider(),
          MenuTile(
            icon: Assets.icons.taskSquare,
            title: '약관 및 정책',
            onTap: () {},
          ),
          MenuDivider(),
          MenuTile(icon: Assets.icons.logout, title: '로그아웃', onTap: () {}),
          MenuDivider(),
          MenuTile(icon: Assets.icons.breakAway, title: '회원탈퇴', onTap: () {}),
          MenuDivider(),
        ],
      ),
    );
  }
}
