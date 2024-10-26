import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rental_manager/app/data/database.dart';
import 'package:rental_manager/app/data/equipment_models.dart';
import 'package:rental_manager/app/modules/ball_page/controllers/ball_page_controller.dart';
import 'package:rental_manager/app/modules/other_page/controllers/other_page_controller.dart';
import 'package:rental_manager/app/modules/tools/componets.dart';

class AddEquipmentPageController extends GetxController {
  final imageData = "".obs;

  final nameInputcontol = TextEditingController();
  final brandInputcontol = TextEditingController();
  final numberInputcontol = TextEditingController();

  final bool isBalls = Get.arguments["isBalls"] ?? false;
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
    brandInputcontol.dispose();
    numberInputcontol.dispose();
    super.onClose();
  }

  void selectPic() async {
    final file = await rmPickSingleImageXFile();
    if (file == null) {
      return;
    }

    final bytes = await file.readAsBytes();
    imageData.value = base64Encode(bytes);
  }

  void submit() async {
    if (imageData.value.isEmpty) {
      BotToast.showText(text: "Please select a photo");
      return;
    }
    if (nameInputcontol.text.isEmpty) {
      BotToast.showText(text: "Please input equipment name");
      return;
    }

    if (brandInputcontol.text.isEmpty) {
      BotToast.showText(text: "Please input equipment brand");
      return;
    }

    if (numberInputcontol.text.isEmpty ||
        int.parse(numberInputcontol.text) <= 0) {
      BotToast.showText(text: "Please input equipment amount");
      return;
    }

    final otherModel = RMequipmentModel();
    otherModel.repertory = int.parse(numberInputcontol.text);
    otherModel.brand = brandInputcontol.text;
    otherModel.name = nameInputcontol.text;
    otherModel.photo = imageData.value;

    await RMDatabase().insertEmModel(otherModel, isBalls: isBalls);
    if (isBalls) {
      if (Get.isRegistered<BallPageController>()) {
        Get.find<BallPageController>().getBalls();
      }
    } else {
      if (Get.isRegistered<OtherPageController>()) {
        Get.find<OtherPageController>().getAllDatas();
      }
    }

    Get.back();
    BotToast.showText(text: "Add Success");
  }
}
