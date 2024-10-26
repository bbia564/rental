import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rental_manager/assets/assets.dart';
import '../controllers/other_page_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_manager/app/modules/tools/componets.dart';
import 'package:rental_manager/app/modules/tools/color_tool.dart';
import 'package:rental_manager/app/modules/ball_page/views/equipment_cell.dart';

class OtherPageView extends GetView<OtherPageController> {
  const OtherPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: rmGetText("Others"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Get.toNamed('/add-equipment-page',
                  arguments: {"title": "Add equipment", "isBalls": false});
            },
            child: Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Image.asset(
                Assets.add,
                height: 22.w,
                width: 22.w,
              ),
            ),
          )
        ],
      ),
      body: Obx(() => controller.others.isEmpty
          ? Center(
              child: rmGetText("no data yet",
                  textColor: RMColorTools.getColor("#999999"),
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            )
          : GridView.builder(
              itemCount: controller.others.length,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14.w,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 165 / 302),
              itemBuilder: (context, index) {
                final model = controller.others[index];
                return EquipmentCell(model: model);
              },
            )),
    );
  }
}
