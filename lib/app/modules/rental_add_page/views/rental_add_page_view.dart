import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rental_manager/app/modules/tools/color_tool.dart';
import 'package:rental_manager/app/modules/tools/componets.dart';

import '../controllers/rental_add_page_controller.dart';

class RentalAddPageView extends GetView<RentalAddPageController> {
  const RentalAddPageView({super.key});
  @override
  Widget build(BuildContext context) {
    final model = controller.model;
    final isLocaImg = model.photo?.isEmpty ?? true;
    return Scaffold(
      appBar: AppBar(
        title: rmGetText("Rent"),
        centerTitle: true,
      ),
      body: rmGetContainer(
          radius: 10.w,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.w),
                      child: isLocaImg
                          ? Image.asset(
                              model.localphoto!,
                              height: 50.w,
                              width: 50.w,
                              fit: BoxFit.cover,
                            )
                          : Image.memory(
                              base64Decode(
                                model.photo!,
                              ),
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                    ),
                    8.horizontalSpace,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        rmGetText(model.name ?? "", fontSize: 14),
                        6.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            rmGetText("Brand: ",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                textColor: RMColorTools.getColor("#A2A2A2")),
                            rmGetText(model.brand ?? "", fontSize: 12),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                16.verticalSpace,
                rmSeparator(),
                14.verticalSpace,
                rmGetText("  Name",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: RMColorTools.getColor("#6A6A6A")),
                6.verticalSpace,
                _inputView(
                  inputContro: controller.nameInputcontol,
                ),
                14.verticalSpace,
                rmGetText("  Cantact",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: RMColorTools.getColor("#6A6A6A")),
                6.verticalSpace,
                _inputView(
                  inputContro: controller.cantactInputcontol,
                ),
                14.verticalSpace,
                rmGetText("  Number",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: RMColorTools.getColor("#6A6A6A")),
                6.verticalSpace,
                _inputView(
                    inputContro: controller.numberInputcontol,
                    keyboardType: TextInputType.number),
                14.verticalSpace,
                rmGetText("  Days",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: RMColorTools.getColor("#6A6A6A")),
                6.verticalSpace,
                _inputView(
                    inputContro: controller.daysInputcontol,
                    keyboardType: TextInputType.number),
                14.verticalSpace,
                rmGetText("  Cash pledge",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: RMColorTools.getColor("#6A6A6A")),
                6.verticalSpace,
                _inputView(
                    inputContro: controller.priceInputcontol,
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
