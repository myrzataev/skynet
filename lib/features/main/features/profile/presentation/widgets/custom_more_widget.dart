
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skynet/core/consts/app_fonts.dart';

class CustomMoreWidget extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback onTap;
  const CustomMoreWidget({
    super.key, required this.icon, required this.text, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(15.r),
        onTap: onTap,
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
          child: SizedBox(
            child: Row(
              children: [
                 ImageIcon(
                  size: 25.h,
                  AssetImage(icon),
                ),
                
                Padding(
                  padding:  EdgeInsets.only(left: 25.w),
                  child: Text(
                    text,
                    style: AppFonts.s14w500.copyWith(color: const Color(0xff808080)),
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
