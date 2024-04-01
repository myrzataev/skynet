import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:skynet/core/consts/app_fonts.dart';

class CustomContainer extends StatelessWidget {
  final String image;
  final String description;
  final String minidesccription;
  final VoidCallback onTap;

  const CustomContainer({
    super.key,
    required this.image,
    required this.description,
    required this.minidesccription,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Make Material widget transparent
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15.r), // Match Ink's border radius
        child: Ink(
          height: 115.h,
          width: 150.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: Colors.white,
            border: GradientBoxBorder(
              gradient: const LinearGradient(
                  colors: [Color(0xffFD4417), Color(0xff8A2783)]),
              width: 2.w,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0.1.r,
                blurRadius: 7.r,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  image,
                  height: 30.h,
                  width: 30.w,
                ),
                Text(
                  description,
                  maxLines: 2,
                  style: AppFonts.s14w500.copyWith(fontSize:ScreenUtil().setSp(13) ),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  minidesccription,
                  style: AppFonts.s8w500,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
