import 'package:get/get.dart';
import 'package:rental_manager/app/data/database.dart';
import 'package:rental_manager/app/data/equipment_models.dart';

class BallPageController extends GetxController {
  final balls = <RMequipmentModel>[].obs;
  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

  }

  @override
  void onClose() {
    super.onClose();
  }

  void getBalls() async {
    balls.value = await RMDatabase().getEquipments();
  }
}
