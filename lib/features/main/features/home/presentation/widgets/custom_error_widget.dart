import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/resources/resources.dart';

class CustomErrorWidget extends StatelessWidget {
  final VoidCallback onTap;
  const CustomErrorWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Images.internetdown,
          height: 200.h,
          width: 200.w,
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Text(
                "Ошибка сервиса",
                style: AppFonts.s22w700,
              ),
            ),
            Text(
              "Попробуйте воспользоваться услугой позже",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: AppFonts.s14w700.copyWith(color: const Color(0xff808080)),
            ),
            TextButton(
                onPressed: onTap,
                child: Text(
                  "Попробуйте еще раз",
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style:
                      AppFonts.s20w500.copyWith(color: Colors.lightBlueAccent),
                ))
          ],
        ),
      ],
    );
  }
}
