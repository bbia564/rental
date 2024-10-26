import 'package:get/get.dart';

import '../controllers/rental_page_controller.dart';

class RentalPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RentalPageController>(
      () => RentalPageController(),
    );
  }
}
