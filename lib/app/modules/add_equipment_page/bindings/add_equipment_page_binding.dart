import 'package:get/get.dart';

import '../controllers/add_equipment_page_controller.dart';

class AddEquipmentPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEquipmentPageController>(
      () => AddEquipmentPageController(),
    );
  }
}
