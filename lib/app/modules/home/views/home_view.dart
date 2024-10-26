import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rental_manager/app/modules/tools/color_tool.dart';
import 'package:rental_manager/assets/assets.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              controller.currentIndex.value = value;
            },
            children: controller.pageList,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            fixedColor: RMColorTools.getColor("#67B717"),
            unselectedLabelStyle: TextStyle(
                color: RMColorTools.getColor("#292929"),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400),
            selectedLabelStyle: TextStyle(
                color: RMColorTools.getColor("#67B717"),
                fontSize: 12.sp,
                fontWeight: FontWeight.w600),
            onTap: (value) {
              controller.currentIndex.value = value;
              controller.pageController.jumpToPage(value);
            },
            items: [
              BottomNavigationBarItem(
                  icon: _tbTbarItem(Assets.ballsNormal),
                  activeIcon: _tbTbarItem(Assets.ballsSelected),
                  label: "Balls"),
              BottomNavigationBarItem(
                  icon: _tbTbarItem(Assets.otherNormal),
                  activeIcon: _tbTbarItem(Assets.otherSelected),
                  label: "Others"),
              BottomNavigationBarItem(
                  icon: _tbTbarItem(Assets.rentalNormal),
                  activeIcon: _tbTbarItem(Assets.rentalSelected),
                  label: "Rental"),
              BottomNavigationBarItem(
                label: "Mine",
                icon: _tbTbarItem(Assets.mineNormal),
                activeIcon: _tbTbarItem(Assets.mineSelected),
              )
            ],
          ),
        ));
  }

  Widget _tbTbarItem(String name) {
    return Image.asset(
      name,
      height: 22.h,
      width: 22.h,
      fit: BoxFit.cover,
    );
  }
}
