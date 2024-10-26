import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_manager/app/data/database.dart';
import 'package:rental_manager/app/modules/tools/pm_dialog.dart';

class MinePageController extends GetxController {
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

  void cellsClick(int index) {
    if (index == 0) {
      showclearAleart();
    } else {
      showVersionAleart();
    }
  }

  void showclearAleart() {
    Get.dialog(Center(
      child: RMDialog(
        title: "Do you want Clear all Records?",
        contentStr: "",
        okAction: cleanDatas,
      ),
    ));
  }

  void showVersionAleart() {
    Get.dialog(Center(
      child: RMDialog(
        title: "App Version",
        contentStr: "V1.0.0",
        okAction: Get.back,
      ),
    ));
  }

  void cleanDatas() async {
    await RMDatabase().clean();

    BotToast.showText(text: "Clear Success");
    Get.back();
  }
}
