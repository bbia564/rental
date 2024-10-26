import 'package:get/get.dart';

import 'rental_build_logic.dart';

class RentalBuildBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
