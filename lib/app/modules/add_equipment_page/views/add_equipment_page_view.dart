import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rental_manager/app/modules/tools/color_tool.dart';
import 'package:rental_manager/app/modules/tools/componets.dart';
import 'package:rental_manager/assets/assets.dart';

import '../controllers/add_equipment_page_controller.dart';

class AddEquipmentPageView extends GetView<AddEquipmentPageController> {
  const AddEquipmentPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: rmGetText("${Get.arguments["title"]}"),
        centerTitle: true,
      ),
      body: rmGetContainer(
          radius: 10.w,
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.all(16.w),
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                4.verticalSpace,
                rmGetText("Photo",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: RMColorTools.getColor("#6A6A6A")),
                12.verticalSpace,
                InkWell(
                    onTap: controller.selectPic,
                    child: Obx(() => controller.imageData.isEmpty
                        ? rmGetContainer(
                            radius: 8.w,
                            width: 90.w,
                            height: 90.w,
                            alignment: Alignment.center,
                            color: RMColorTools.getColor("#F7F7F7"),
                            child: Image.asset(
                              Assets.addPhoto,
                              height: 20.h,
                              width: 20.w,
                            ))
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8.w),
                            child: Image.memory(
                              base64Decode(controller.imageData.value),
                              width: 90.w,
                              height: 90.h,
                              fit: BoxFit.cover,
                            ),
                          ))),
                12.verticalSpace,
                rmGetText("  Equipment Name",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: RMColorTools.getColor("#6A6A6A")),
                6.verticalSpace,
                _inputView(
                  inputContro: controller.nameInputcontol,
                ),
                12.verticalSpace,
                rmGetText("  Brand",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: RMColorTools.getColor("#6A6A6A")),
                6.verticalSpace,
                _inputView(
                  inputContro: controller.brandInputcontol,
                ),
                12.verticalSpace,
                rmGetText("  Inventory",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: RMColorTools.getColor("#6A6A6A")),
                6.verticalSpace,
                _inputView(
                    inputContro: controller.numberInputcontol,
                    keyboardType: TextInputType.number),
                25.verticalSpace,
                InkWell(
                  onTap: controller.submit,
                  child: rmGetContainer(
                    radius: 5.w,
                    height: 45.w,
                    width: double.infinity,
                    alignment: Alignment.center,
                    color: RMColorTools.getColor("#67B717"),
                    child: rmGetText("Submit",
                        fontSize: 14, textColor: Colors.white),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget _inputView(
      {TextEditingController? inputContro,
      TextInputType? keyboardType,
      int? maxLength}) {
    return rmGetContainer(
        radius: 4.w,
        height: 46.w,
        width: double.infinity,
        color: RMColorTools.getColor("#F8F8F8"),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        alignment: Alignment.center,
        child: TextField(
            controller: inputContro,
            keyboardType: keyboardType,
            textAlign: TextAlign.left,
            maxLength: maxLength,
            maxLines: 1,
            style: TextStyle(color: Colors.black, fontSize: 16.sp),
            decoration: InputDecoration(
                counterText: "",
                border: InputBorder.none,
                hintText: 'input',
                hintStyle: TextStyle(
                    color: RMColorTools.getColor('#8C8C8C'),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal))));
  }
}
