import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/core/services/open_dialer.dart';
import 'package:skynet/resources/resources.dart';

class RateServiceEngineerSmallWidget extends StatelessWidget {
  final String phoneNumber;
  final String nameSurName;
  final String photo;
  const RateServiceEngineerSmallWidget({
    super.key,
    required this.phoneNumber,
    required this.nameSurName, required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(
                photo,
               
                height: 54.h,
                width: 54.w,
              ),
            ),
            SizedBox(
              width: 220.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Сервис-инженер:",
                    style: AppFonts.s10w500,
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    nameSurName,
                    style: AppFonts.s16w400,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 1,
                  ),
                  Text(
                    phoneNumber,
                    style: AppFonts.s12w500,
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  OpenDialer.launchCaller(urlL: phoneNumber);
                },
                child: Ink(
                  height: 46.h,
                  width: 46.w,
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
                          offset: Offset(0, 2.h), // changes position of shadow
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      Images.serviceEngineerNumber,
                      height: 10.h,
                      width: 10.w,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
