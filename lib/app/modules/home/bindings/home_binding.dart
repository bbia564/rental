import 'package:get/get.dart';
import 'package:rental_manager/app/data/database.dart';
import 'package:rental_manager/app/modules/ball_page/controllers/ball_page_controller.dart';
import 'package:rental_manager/app/modules/mine_page/controllers/mine_page_controller.dart';
import 'package:rental_manager/app/modules/other_page/controllers/other_page_controller.dart';
import 'package:rental_manager/app/modules/rental_page/controllers/rental_page_controller.dart';
import 'package:rental_manager/app/modules/tools/local_manager.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    RMSharedPreferences.initialize();
    RMDatabase().init();
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<BallPageController>(
      () => BallPageController(),
    );

    Get.lazyPut<OtherPageController>(
      () => OtherPageController(),
    );

    Get.lazyPut<RentalPageController>(
      () => RentalPageController(),
    );

    Get.lazyPut<MinePageController>(
      () => MinePageController(),
    );
  }
}
