import 'package:get/get.dart';

import '../controllers/ball_page_controller.dart';

class BallPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BallPageController>(
      () => BallPageController(),
    );
  }
}
