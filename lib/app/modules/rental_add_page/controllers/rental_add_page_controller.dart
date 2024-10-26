import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rental_manager/app/data/database.dart';
import 'package:rental_manager/app/data/equipment_models.dart';
import 'package:rental_manager/app/modules/rental_page/bindings/rental_page_binding.dart';
import 'package:rental_manager/app/modules/rental_page/controllers/rental_page_controller.dart';

class RentalAddPageController extends GetxController {
  final RMequipmentModel model = Get.arguments["model"];

  final nameInputcontol = TextEditingController();
  final cantactInputcontol = TextEditingController();
  final numberInputcontol = TextEditingController();
  final daysInputcontol = TextEditingController();
  final priceInputcontol = TextEditingController();
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
    nameInputcontol.dispose();
    cantactInputcontol.dispose();
    numberInputcontol.dispose();
    daysInputcontol.dispose();
    priceInputcontol.dispose();
    super.onClose();
  }

  void submit() async {
    if (nameInputcontol.text.isEmpty) {
      BotToast.showText(text: "Please input name");
      return;
    }

    if (cantactInputcontol.text.isEmpty) {
      BotToast.showText(text: "Please input phone number");
      return;
    }

    if (numberInputcontol.text.isEmpty ||
        int.parse(numberInputcontol.text) <= 0) {
      BotToast.showText(text: "Please input equipment amount");
      return;
    }

    if (daysInputcontol.text.isEmpty || int.parse(daysInputcontol.text) <= 0) {
      BotToast.showText(text: "Please input rental days ");
      return;
    }

    if (priceInputcontol.text.isEmpty) {
      BotToast.showText(text: "Please input  cash pledge");
      return;
    }

    try {
      final rentalMode = RMrentalModel();
      rentalMode.name = model.name;
      rentalMode.brand = model.brand;

      rentalMode.photo = model.photo;
      rentalMode.localphoto = model.localphoto;

      rentalMode.repertory = int.parse(numberInputcontol.text);
      rentalMode.days = int.parse(daysInputcontol.text);
      rentalMode.rentalName = nameInputcontol.text;
      rentalMode.rentalphone = cantactInputcontol.text;
      rentalMode.type = 1;
      rentalMode.overdue = 1;

      await RMDatabase().insertRENTALModel(rentalMode);

      if (Get.isRegistered<RentalPageController>()) {
        Get.find<RentalPageController>().getRentalDetail();
      }

      Get.back();
      BotToast.showText(text: "Add Success");
    } catch (e) {
      BotToast.showText(text: "Please check your input");
    }
  }
}
