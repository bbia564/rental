import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rental_manager/app/modules/rental_page/views/rental_detail_cell.dart';
import 'package:rental_manager/app/modules/tools/color_tool.dart';
import 'package:rental_manager/app/modules/tools/componets.dart';
import 'package:rental_manager/assets/assets.dart';

import '../controllers/rental_page_controller.dart';

class RentalPageView extends GetView<RentalPageController> {
  const RentalPageView({super.key});
  @override
  Widget build(BuildContext context) {
    final unExvIEW = Obx(() => controller.allUnexModels.isEmpty
        ? Expanded(
            child: Center(
            child: rmGetText("no datas",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textColor: RMColorTools.getColor("#999999")),
          ))
        : Expanded(
            child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: controller.allUnexModels.length,
            itemBuilder: (context, index) {
              final item = controller.allUnexModels[index];

              return RentalDetailCell(model: item);
            },
          )));

    final exView = Obx(() => controller.allExModels.isEmpty
        ? Expanded(
            child: Center(
            child: rmGetText("no datas",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textColor: RMColorTools.getColor("#999999")),
          ))
        : Expanded(
            child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: controller.allExModels.length,
            itemBuilder: (context, index) {
              final item = controller.allExModels[index];

              return RentalDetailCell(model: item);
            },
          )));

    return Scaffold(
      appBar: AppBar(
        title: rmGetText('Rental Detail'),
        centerTitle: true,
        // actions: [
        //   InkWell(
        //     onTap: controller.getRentalDetail,
        //     child: Padding(
        //       padding: EdgeInsets.only(right: 20.w),
        //       child: Image.asset(
        //         Assets.add,
        //         height: 22.w,
        //         width: 22.w,
        //       ),
        //     ),
        //   )
        // ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          rmSeparator(),
          rmGetContainer(
              height: 46.w,
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Obx(() {
                    final selected = controller.selectedIndex.value == 0;
                    return InkWell(
                        onTap: () {
                          controller.selectedIndex.value = 0;
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            rmGetText("Unexpired",
                                fontWeight: selected
                                    ? FontWeight.bold
                                    : FontWeight.w400),
                            12.verticalSpace,
                            selected
                                ? Container(
                                    width: 150.w,
                                    height: 2.w,
                                    color: RMColorTools.getColor("#67B717"),
                                  )
                                : SizedBox(
                                    height: 2.w,
                                    width: 150,
                                  )
                          ],
                        ));
                  }),
                  Obx(() {
                    final selected = controller.selectedIndex.value == 1;
                    return InkWell(
                      onTap: () {
                        controller.selectedIndex.value = 1;
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          rmGetText("Expired",
                              fontWeight:
                                  selected ? FontWeight.bold : FontWeight.w400),
                          12.verticalSpace,
                          selected
                              ? Container(
                                  width: 150.w,
                                  height: 2.w,
                                  color: RMColorTools.getColor("#67B717"),
                                )
                              : SizedBox(
                                  height: 2.w,
                                  width: 150,
                                )
                        ],
                      ),
                    );
                  })
                ],
              )),
          Obx(() => controller.selectedIndex.value == 0 ? unExvIEW : exView)
        ],
      ),
    );
  }
}
