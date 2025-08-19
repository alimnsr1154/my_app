import 'package:get/get.dart';

class StatsController extends GetxController {
  // Reactive integer fields
  var applied = 32.obs;     // 신청
  var inProgress = 44.obs;  // 진행중
  var completed = 57.obs;   // 완료

  // Function to update values (can be called from API/repo later)
  void updateStats({int? appliedValue, int? inProgressValue, int? completedValue}) {
    if (appliedValue != null) applied.value = appliedValue;
    if (inProgressValue != null) inProgress.value = inProgressValue;
    if (completedValue != null) completed.value = completedValue;
  }
}
