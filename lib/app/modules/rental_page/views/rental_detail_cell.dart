import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rental_manager/app/data/database.dart';
import 'package:rental_manager/app/data/equipment_models.dart';
import 'package:rental_manager/app/modules/rental_page/controllers/rental_page_controller.dart';
import 'package:rental_manager/app/modules/tools/color_tool.dart';
import 'package:rental_manager/app/modules/tools/componets.dart';

class RentalDetailCell extends StatelessWidget {
  final RMrentalModel model;
  const RentalDetailCell({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final isLocaImg = model.photo?.isEmpty ?? true;
    var opStr = "No return";
    if (model.overdue == 1) {
      opStr = "Returned";
    }
    GlobalKey opKey = GlobalKey();
    return rmGetContainer(
        radius: 10.w,
        margin: EdgeInsets.only(top: 10.w),
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
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
            12.verticalSpace,
            rmGetContainer(
                radius: 6.w,
                color: RMColorTools.getColor("#F8F8F8"),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        rmGetText("Tenant: ",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            textColor: RMColorTools.getColor("#A2A2A2")),
                        rmGetText(model.rentalName ?? "", fontSize: 12),
                        const Spacer(),
                        rmGetText("Days: ",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            textColor: RMColorTools.getColor("#A2A2A2")),
                        rmGetText("${model.days}", fontSize: 12),
                        const Spacer()
                      ],
                    ),
                    12.verticalSpace,
                    rmSeparator(),
                    12.verticalSpace,
                    Row(
                      children: [
                        rmGetText("Contact: ",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            textColor: RMColorTools.getColor("#A2A2A2")),
                        rmGetText(model.rentalphone ?? "", fontSize: 12),
                        const Spacer(),
                        rmGetText("Amount: ",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            textColor: RMColorTools.getColor("#A2A2A2")),
                        rmGetText(model.repertory.toString(), fontSize: 12),
                        const Spacer()
                      ],
                    ),
                  ],
                )),
            16.verticalSpace,
            Row(
              children: [
                10.horizontalSpace,
                InkWell(
                  key: opKey,
                  onTap: () {
                    showPopup(context, opKey);
                  },
                  child: rmGetText("Operate", fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                rmGetContainer(
                  radius: 6.w,
                  height: 36.w,
                  width: 136.w,
                  color: RMColorTools.getColor("#67B717"),
                  alignment: Alignment.center,
                  child:
                      rmGetText(opStr, fontSize: 14, textColor: Colors.white),
                )
              ],
            )
          ],
        ));
  }

  void showPopup(BuildContext context, GlobalKey key) async {

    if (model.overdue == 1) {

      BotToast.showText(text: "You have aready returned");
      return;
    }

    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    final int? selectedValue = await showMenu(
      context: context,
      color: Colors.white,
      position:
          RelativeRect.fromLTRB(offset.dx, offset.dy, offset.dx, offset.dy),
      items: [
        const PopupMenuItem<int>(
          value: 1,
          
          child: Text('Return'),
        ),
      ],
      elevation: 8.0,
    );

    if (selectedValue == 1) {
      model.overdue = 1;
      await RMDatabase().updateRentalModel(model);
      BotToast.showText(text: "Return Success");
      Get.find<RentalPageController>().getRentalDetail();
    }
  }
}
