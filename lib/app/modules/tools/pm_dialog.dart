
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_manager/app/modules/tools/color_tool.dart';
import 'package:rental_manager/app/modules/tools/componets.dart';

class RMDialog extends StatelessWidget {
  final String title;
  final String contentStr;
  final Function() okAction;
  final Function()? cancleAction;
  const RMDialog(
      {super.key,
      this.cancleAction,
      required this.okAction,
      required this.title,
      required this.contentStr});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: rmGetContainer(
            radius: 10.w,
            width: 300.w,
            height: 170.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                14.verticalSpace,
                rmGetText(title, fontSize: 14),
                13.verticalSpace,
                rmGetText(contentStr),
                20.verticalSpace,
                Divider(
                  color: RMColorTools.getColor("#EFEFEF"),
                ),
                SizedBox(
                  height: 46.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: Get.back,
                          child: Container(
                            alignment: Alignment.center,
                            child: rmGetText("Cancel",
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      rmGetContainer(
                        height: 30.h,
                        width: 1,
                        color: RMColorTools.getColor("#EFEFEF"),
                      ),
                      Flexible(
                          flex: 1,
                          child: InkWell(
                            onTap: okAction,
                            child: Container(
                              alignment: Alignment.center,
                              child: rmGetText("YES",
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            )));
  }
}
