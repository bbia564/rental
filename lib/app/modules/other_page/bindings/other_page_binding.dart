import 'package:get/get.dart';

import '../controllers/other_page_controller.dart';

class OtherPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtherPageController>(
      () => OtherPageController(),
    );
  }
}
