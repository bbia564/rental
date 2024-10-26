import 'package:get/get.dart';
import 'package:rental_manager/app/data/database.dart';
import 'package:rental_manager/app/data/equipment_models.dart';

class OtherPageController extends GetxController {


  final others = <RMequipmentModel>[].obs;
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

  void getAllDatas() async {
    others.value = await RMDatabase().getEquipments(isBalls: false);
  }
}
