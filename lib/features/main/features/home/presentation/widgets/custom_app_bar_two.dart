import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/resources/resources.dart';

class CustomAppBarWithoutProfileDetails extends StatelessWidget {
  final String appBarTitle;
  const CustomAppBarWithoutProfileDetails(
      {super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120.h,
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
        child: Padding(
          padding: EdgeInsets.only(top: 50.h, left: 25.w),
          child: Row(
            
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: ImageIcon(
                  const AssetImage(
                    Images.closeicon,
                  ),
                  size: 24.h,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              Text(
                appBarTitle,
                style: AppFonts.s22w700,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ));
  }
}
