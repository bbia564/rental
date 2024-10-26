import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rental_manager/app/modules/ball_page/views/equipment_cell.dart';
import 'package:rental_manager/app/modules/tools/color_tool.dart';
import 'package:rental_manager/app/modules/tools/componets.dart';
import 'package:rental_manager/assets/assets.dart';

import '../controllers/ball_page_controller.dart';

class BallPageView extends GetView<BallPageController> {
  const BallPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: rmGetText("Balls"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Get.toNamed('/add-equipment-page',arguments: {"title":"Add Balls","isBalls":true});
            },
            child: Padding(padding: EdgeInsets.only(right: 20.w),child: Image.asset(Assets.add,height: 22.w,width: 22.w,),),
          )
        ],
      ),
      body: Obx(() => controller.balls.isEmpty
          ? Center(
              child: rmGetText("no data yet",
                  textColor: RMColorTools.getColor("#999999"),
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            )
          : GridView.builder(
              itemCount: controller.balls.length,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14.w,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 165 / 302),
              itemBuilder: (context, index) {
                final model = controller.balls[index];
                return EquipmentCell(model: model);
              },
            )),
    );
  }
}
