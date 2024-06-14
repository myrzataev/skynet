import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/resources/resources.dart';

class CustomAppBar extends StatelessWidget {
  final String nameSurName;
  final String address;
  const CustomAppBar({
    super.key,
    required this.nameSurName,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 122.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.2,
              blurRadius: 7,
              offset: const Offset(0, 0.5), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.r),
              bottomRight: Radius.circular(12.r))),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 25.w),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              width: 270.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameSurName,
                    style: AppFonts.s24w700,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    address,
                    style: AppFonts.s12w500,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  )
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 25.w),
              child: Image.asset(
                Images.logo,
                height: 30.h,
                width: 30.w,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
