import 'package:get/get.dart';

import '../controllers/rental_add_page_controller.dart';

class RentalAddPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RentalAddPageController>(
      () => RentalAddPageController(),
    );
  }
}
