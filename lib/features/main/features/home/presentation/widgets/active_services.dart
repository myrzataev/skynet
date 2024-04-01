import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skynet/core/consts/app_fonts.dart';

class ActiveServices extends StatelessWidget {
  final String? serviceName;
  final String status;
  final String imageOfService;
  final String priceOfTarif;
  const ActiveServices({
    super.key,
    required this.serviceName,
    required this.status,
    required this.imageOfService, required this.priceOfTarif,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
       
        children: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Image.asset(
              imageOfService,
              height: 44.h,
              width: 44.w,
            ),
          ),
          SizedBox(
            height: 52.h,
            width: 260.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Тариф:  ",
                      style: AppFonts.s14w500,
                    ),
                    Text(
                      serviceName ?? "Ok",
                      style: AppFonts.s14w500,
                    ),
                    Text("($priceOfTarif)", style: AppFonts.s14w500,)
                  ],
                ),
                Text(
                  status,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 1,
                  style: AppFonts.s14w700,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
