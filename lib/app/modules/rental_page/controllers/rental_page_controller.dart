import 'package:get/get.dart';
import 'package:rental_manager/app/data/database.dart';
import 'package:rental_manager/app/data/equipment_models.dart';

class RentalPageController extends GetxController {
  final selectedIndex = 0.obs;

  final allExModels = <RMrentalModel>[].obs;
  final allUnexModels = <RMrentalModel>[].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getRentalDetail();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getRentalDetail() async {
    final allRental = await RMDatabase().getAllRentalDetal();

    final temp = <RMrentalModel>[];
    final unTemp = <RMrentalModel>[];
    for (var element in allRental) {
      if (element.type == 1) {
        unTemp.add(element);
      } else {
        temp.add(element);
      }
    }
    allExModels.value = temp;
    allUnexModels.value = unTemp;

  }
}
