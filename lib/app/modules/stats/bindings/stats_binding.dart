import 'package:get/get.dart';
import '../controllers/stats_controller.dart';

class StatsBinding extends Bindings {
  @override
  void dependencies() {
    // Registers StatsController lazily
    Get.lazyPut<StatsController>(() => StatsController());
  }
}
