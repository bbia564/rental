import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rental_manager/app/data/equipment_models.dart';
import 'package:rental_manager/app/modules/tools/color_tool.dart';
import 'package:rental_manager/app/modules/tools/componets.dart';

class EquipmentCell extends StatelessWidget {
  final RMequipmentModel model;
  const EquipmentCell({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final isLocaImg = model.photo?.isEmpty ?? true;
    return rmGetContainer(
        radius: 10.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: isLocaImg
                  ? Image.asset(
                      model.localphoto!,
                      height: double.infinity,
                      width: double.infinity,
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
            6.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  rmGetText(model.name ?? "", fontSize: 14),
                  6.verticalSpace,
                  rmSeparator(),
                  6.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      rmGetText("Brand:",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          textColor: RMColorTools.getColor("#A2A2A2")),
                      rmGetText(model.brand ?? "", fontSize: 12),
                    ],
                  ),
                  4.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      rmGetText("Inventory:",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          textColor: RMColorTools.getColor("#A2A2A2")),
                      rmGetText(model.repertory.toString(), fontSize: 12),
                    ],
                  ),
                  8.verticalSpace,
                  InkWell(
                    onTap: () {
                      Get.toNamed('/rental-add-page',arguments: {"model":model});
                    },
                    child: rmGetContainer(
                      radius: 6.w,
                      height: 36.w,
                      width: double.infinity,
                      color: RMColorTools.getColor("#67B717"),
                      alignment: Alignment.center,
                      child: rmGetText("Rental",
                          fontSize: 14, textColor: Colors.white)),
                  )
                ],
              ),
            ),
            10.verticalSpace,
          ],
        ));
  }
}
