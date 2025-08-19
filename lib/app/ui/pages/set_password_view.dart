import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:my_app/app/ui/widgets/layouts/basic_view_layout.dart';
import 'package:my_app/app/ui/widgets/buttons/primary_button.dart';
import 'package:my_app/app/ui/widgets/text_fields/text_field.dart';

@RoutePage()
class SetPasswordView extends HookWidget {
  const SetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    // 👇 Hook-based controllers (dispose automatically handled)
    final currentPasswordController = useTextEditingController();
    final newPasswordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    // 👇 Rebuild UI whenever any field changes
    useListenable(currentPasswordController);
    useListenable(newPasswordController);
    useListenable(confirmPasswordController);

    final areAllFieldsFilled =
        currentPasswordController.text.isNotEmpty &&
        newPasswordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty;

    return BasicViewLayout(
      headerTitle: '비밀번호 설정',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Gap(deviceHeight * 0.01),
          CustomTextField(
            title: '기본 비밀번호',
            placeholder: '8-16자리 영문, 숫자, 특수문자 조합',
            isRequired: true,
            controller: currentPasswordController,
          ),
          Gap(deviceHeight * 0.02),
          CustomTextField(
            title: '새 비밀번호',
            placeholder: '8-16자리 영문, 숫자, 특수문자 조합',
            isRequired: true,
            controller: newPasswordController,
          ),
          Gap(deviceHeight * 0.02),
          CustomTextField(
            title: '비밀번호 확인',
            placeholder: '비밀번호를 재입력해 주세요.',
            isRequired: true,
            controller: confirmPasswordController,
          ),
          Spacer(),
          PrimaryButton(
            label: "완료",
            isEnabled: areAllFieldsFilled,
            onPressed:
                areAllFieldsFilled
                    ? () {
                      if (newPasswordController.text ==
                          confirmPasswordController.text) {
                        debugPrint(
                          "Password updated: ${newPasswordController.text}",
                        );
                      } else {
                        debugPrint("Passwords do not match!");
                      }
                    }
                    : null,
          ),
        ],
      ),
    );
  }
}
