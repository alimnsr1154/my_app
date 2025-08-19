import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:my_app/app/ui/utils/assets.dart';
import 'package:my_app/app/ui/widgets/layouts/basic_view_layout.dart';
import 'package:my_app/app/ui/widgets/buttons/primary_button.dart';
import 'package:my_app/app/ui/widgets/text_fields/text_field.dart';

@RoutePage()
class BasicInformationView extends HookWidget {
  const BasicInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    // 👇 Hook-based controllers (auto dispose)
    final idController = useTextEditingController(text: "");
    final emailController = useTextEditingController();
    final phoneController = useTextEditingController();
    final nicknameController = useTextEditingController();
    final instagramController = useTextEditingController();
    final linkController = useTextEditingController();
    final portfolioController = useTextEditingController();

    // 👇 listen for changes so the widget rebuilds when fields change
    useListenable(emailController);
    useListenable(phoneController);
    useListenable(nicknameController);
    useListenable(instagramController);
    useListenable(linkController);
    useListenable(portfolioController);

    final areAllFieldsFilled =
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        nicknameController.text.isNotEmpty &&
        instagramController.text.isNotEmpty &&
        linkController.text.isNotEmpty &&
        portfolioController.text.isNotEmpty;

    return BasicViewLayout(
      headerTitle: '기본정보',
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Gap(deviceHeight * 0.01),
                  CustomTextField(
                    title: '아이디',
                    placeholder: 'asdf123',
                    readOnly: true,
                    controller: idController,
                  ),
                  Gap(deviceHeight * 0.02),
                  CustomTextField(
                    title: '이메일',
                    placeholder: 'asdf123@naver.com',
                    controller: emailController,
                  ),
                  Gap(deviceHeight * 0.02),
                  CustomTextField(
                    title: '휴대폰 번호',
                    placeholder: '010-1234-5678',
                    controller: phoneController,
                  ),
                  Gap(deviceHeight * 0.02),
                  CustomTextField(
                    title: '닉네임',
                    placeholder: '장발산',
                    controller: nicknameController,
                  ),
                  Gap(deviceHeight * 0.02),
                  CustomTextField(
                    title: '인스타그램 아이디',
                    placeholder: 'ffkdo_sah',
                    controller: instagramController,
                  ),
                  Gap(deviceHeight * 0.02),
                  CustomTextField(
                    title: '대표 작업 링크',
                    placeholder: 'https://www.naver.com/',
                    controller: linkController,
                  ),
                  Gap(deviceHeight * 0.02),
                  CustomTextField(
                    title: '포트폴리오',
                    placeholder: '포트폴리오.pdf',
                    suffixIconAsset: Assets.icons.attachment,
                    controller: portfolioController,
                  ),
                ],
              ),
            ),
          ),

          // 👇 Reusable primary button
          PrimaryButton(
            label: "저장하기",
            isEnabled: areAllFieldsFilled,
            onPressed:
                areAllFieldsFilled
                    ? () {
                      debugPrint("ID: ${idController.text}");
                      debugPrint("Email: ${emailController.text}");
                      debugPrint("Phone: ${phoneController.text}");
                      debugPrint("Nickname: ${nicknameController.text}");
                      debugPrint("Instagram: ${instagramController.text}");
                      debugPrint("Link: ${linkController.text}");
                      debugPrint("Portfolio: ${portfolioController.text}");
                    }
                    : null,
          ),
        ],
      ),
    );
  }
}
