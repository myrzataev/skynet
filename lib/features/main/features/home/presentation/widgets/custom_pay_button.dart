import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/resources/resources.dart';

class PayButton extends StatelessWidget {
  final VoidCallback onTap;
  const PayButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(15.r),
        onTap: onTap,
        child: Ink(
         
          height: 58.5.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Colors.white,
              border:  GradientBoxBorder(
                gradient: const  LinearGradient(
                    colors: [Color(0xffFD4417), Color(0xff8A2783)]),
                width: 2.w,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 0.1.r,
                  blurRadius: 7.r,
                  offset:  Offset(0, 2.h), // changes position of shadow
                ),
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 25.w,
                vertical: 8.h),
            child: Row(
              children: [
                Image.asset(
                  Images.wallet,
                  height: 30.h,
                  width: 30.w,
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 30.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Оплатить за интернет",
                        style: AppFonts.s14w500,
                      ),
                      Text("Онлайн перевод", style: AppFonts.s10w500)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
