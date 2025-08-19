import 'package:get/get.dart';
import 'package:my_app/app/data/models/products.dart';
import 'package:my_app/app/ui/utils/assets.dart';

class ProductsController extends GetxController {
  // Tabs: 신청, 진행중, 완료
  var selectedTab = 0.obs;

  // Dummy products list (can later fetch from API)
  final products =
      <Product>[
        Product(
          title: "회사명 나오는 자리",
          description: "소개말 나오는 자리입니다 한줄만 나옵니다....",
          imageUrl: Assets.images.pic1,
          tags: ["F&B", "패션", "육아/키즈", "리빙/레저"],
        ),
        Product(
          title: "회사명 나오는 자리",
          description: "소개말 나오는 자리입니다 한줄만 나옵니다....",
          imageUrl: Assets.images.pic2,
          tags: ["F&B", "패션", "육아/키즈", "리빙/레저"],
        ),
        Product(
          title: "회사명 나오는 자리",
          description: "소개말 나오는 자리입니다 한줄만 나옵니다....",
          imageUrl: Assets.images.pic3,
          tags: ["F&B", "패션", "육아/키즈", "리빙/레저"],
        ),
        Product(
          title: "회사명 나오는 자리",
          description: "소개말 나오는 자리입니다 한줄만 나옵니다. 소개말 나...",
          imageUrl: Assets.images.pic4,
          tags: ["F&B", "패션", "육아/키즈", "리빙/레저"],
        ),
      ].obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }
}
