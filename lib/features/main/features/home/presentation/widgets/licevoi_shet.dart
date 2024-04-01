import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/resources/resources.dart';

class LicevoiShetWidget extends StatelessWidget {
  final int licevoiShet;

  final VoidCallback? onTap;

  const LicevoiShetWidget({
    super.key,
    required this.licevoiShet,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
       Padding(
         padding:  EdgeInsets.only(bottom: 7.h),
         child: Text(
          "Лицевой счет:",
          style: AppFonts.s16w700,
               ),
       ),
      Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15.r),
          onTap: () {
            onTap;
        
            if (onTap != null) {
              onTap!();
            }
            Fluttertoast.showToast(
                msg: "Скопировано",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.grey,
                textColor: Colors.white,
                fontSize: 16.0.sp);
          },
          child: Container(
            height: 32.h,
            width: 170.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.2,
                    blurRadius: 2,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ]),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Text(
                    licevoiShet.toString(),
                    style: AppFonts.s20w500,
                  ),
                  const Spacer(),
                  Image.asset(
                    Images.copylogo,
                    height: 20.h,
                    width: 20.w,
                    color: const Color(0xff808080),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
