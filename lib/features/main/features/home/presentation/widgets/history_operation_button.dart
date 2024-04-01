import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/resources/resources.dart';

class HistoryOperationButton extends StatelessWidget {
  final String summ;
  const HistoryOperationButton({
    super.key, required this.summ,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.3),
          //     spreadRadius: 0.1,
          //     blurRadius: 7,
          //     offset: const Offset(0, 2), // changes position of shadow
          //   ),
          // ]
          ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
        ),
        child: Row(
          children: [
            Image.asset(
              Images.storyofoperation,
              height: 24.h,
              width: 24.w,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Состояние счета:", style: AppFonts.s14w500),
                  Row(
                    children: [
                      Text(
                        "Итого к оплате ",
                        style: AppFonts.s12w500
                            .copyWith(color: const Color(0xff808080)),
                      ),
                      Text(
                        summ,
                        style: AppFonts.s12w700
                            .copyWith(color: const Color(0xff808080)),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
