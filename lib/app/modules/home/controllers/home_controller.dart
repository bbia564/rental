import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rental_manager/app/modules/ball_page/views/ball_page_view.dart';
import 'package:rental_manager/app/modules/mine_page/views/mine_page_view.dart';
import 'package:rental_manager/app/modules/other_page/views/other_page_view.dart';
import 'package:rental_manager/app/modules/rental_page/views/rental_page_view.dart';

class HomeController extends GetxController  {
  RxInt currentIndex = 0.obs;
  final PageController pageController = PageController(initialPage: 0);
  List<Widget> pageList = [
    const BallPageView(),
    const OtherPageView(),
    const RentalPageView(),
    const MinePageView()
  ];

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

  void changeCurrentPageIndex(int index) {
    currentIndex.value = index;
  }


}

