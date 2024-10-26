import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rental_manager/app/modules/tools/app_util.dart';
import 'package:rental_manager/app/modules/tools/color_tool.dart';

import 'app/data/equ_being.dart';
import 'app/modules/add_equipment_page/bindings/add_equipment_page_binding.dart';
import 'app/modules/add_equipment_page/views/add_equipment_page_view.dart';
import 'app/modules/ball_page/bindings/ball_page_binding.dart';
import 'app/modules/ball_page/views/ball_page_view.dart';
import 'app/modules/home/bindings/home_binding.dart';
import 'app/modules/home/views/home_view.dart';
import 'app/modules/mine_page/bindings/mine_page_binding.dart';
import 'app/modules/mine_page/views/mine_page_view.dart';
import 'app/modules/other_page/bindings/other_page_binding.dart';
import 'app/modules/other_page/views/other_page_view.dart';
import 'app/modules/rental_add_page/bindings/rental_add_page_binding.dart';
import 'app/modules/rental_add_page/views/rental_add_page_view.dart';
import 'app/modules/rental_build/rental_build_binding.dart';
import 'app/modules/rental_build/rental_build_view.dart';
import 'app/modules/rental_page/bindings/rental_page_binding.dart';
import 'app/modules/rental_page/views/rental_page_view.dart';

void main() {
  runApp(_initApp());
}

Widget ceInitGetMaterialApp({
  Widget Function(BuildContext, Widget?)? builder,
}) {
  return GetMaterialApp(
    darkTheme: ThemeData.dark(),
    useInheritedMediaQuery: true,
    themeMode: ThemeMode.light,
    fallbackLocale: const Locale("en", "US"),
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    getPages: Lists,
    defaultTransition: Transition.rightToLeft,
    theme: ThemeData(
        scaffoldBackgroundColor: RMColorTools.getColor("#F7F7F7"),
        indicatorColor: Colors.grey,
        brightness: Brightness.light,
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.white.withOpacity(0),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: RMColorTools.getColor("#0F0F0F")),
          systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarIconBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Colors.white,
              statusBarColor: RMColorTools.getColor("#31BA6B")),
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0.0,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(backgroundColor: Colors.white)),
    builder: builder,
    navigatorObservers: [BotToastNavigatorObserver()],
    supportedLocales: const [
      Locale('en', 'US'),
    ],
    localizationsDelegates: const [
      GlobalWidgetsLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
  );
}

_initApp() {
  if (!kIsWeb && Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  _setBotToast();

  Widget body = ceInitGetMaterialApp(
    builder: (context, child) {
      final botToastBuilder = BotToastInit();

      return ScreenUtilInit(
        designSize: const Size(375, 812),
        useInheritedMediaQuery: true,
        builder: (p0, p1) {
          Widget body = GestureDetector(
            onTap: () {
              RMAppTool.keyboardDis(context);
            },
            child: child,
          );
          body = botToastBuilder(context, body);
          return body;
        },
      );
    },
  );
  return body;
}

void _setBotToast() {
  BotToast.defaultOption.notification.animationDuration =
      const Duration(seconds: 2);
}
List<GetPage<dynamic>> Lists = [
  GetPage(
    name: '/',
    page: () => const RentalBuildView(),
    binding: RentalBuildBinding(),
  ),
  GetPage(
    name: '/home',
    page: () => const HomeView(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: '/ball-page',
    page: () => const BallPageView(),
    binding: BallPageBinding(),
  ),
  GetPage(
    name: '/equ-be',
    page: () => const EquBeing(),
  ),
  GetPage(
    name: '/other-page',
    page: () => const OtherPageView(),
    binding: OtherPageBinding(),
  ),
  GetPage(
    name: '/rental-page',
    page: () => const RentalPageView(),
    binding: RentalPageBinding(),
  ),
  GetPage(
    name: '/add-equipment-page',
    page: () => const AddEquipmentPageView(),
    binding: AddEquipmentPageBinding(),
  ),
  GetPage(
    name: '/mine-page',
    page: () => const MinePageView(),
    binding: MinePageBinding(),
  ),
  GetPage(
    name: '/rental-add-page',
    page: () => const RentalAddPageView(),
    binding: RentalAddPageBinding(),
  ),
];