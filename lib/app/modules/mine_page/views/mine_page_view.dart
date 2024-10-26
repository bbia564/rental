import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rental_manager/app/modules/tools/componets.dart';
import 'package:rental_manager/assets/assets.dart';

import '../controllers/mine_page_controller.dart';

class MinePageView extends GetView<MinePageController> {
  const MinePageView({Key? key}) : super(key: key);

  Widget cells(String t, String icon, int index) {
    return InkWell(
      onTap: () {
        controller.cellsClick(index);
      },
      child: rmGetContainer(
          radius: 10.w,
          height: 48.h,
          margin: EdgeInsets.only(bottom: 10.w),
          alignment: Alignment.center,
          child: Row(
            children: [
              24.horizontalSpace,
              Image.asset(
                icon,
                height: 16.w,
                width: 16.w,
              ),
              10.horizontalSpace,
              rmGetText(t, fontSize: 14, fontWeight: FontWeight.w400),
              const Spacer(),
              Image.asset(
                Assets.jaintou,
                height: 14.w,
                width: 14.w,
              ),
              20.horizontalSpace
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: rmGetText("Mine"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cells("Clear", Assets.clear, 0),
            cells("About", Assets.aboutus, 1),
          ],
        ),
      ),
    );
  }
}
