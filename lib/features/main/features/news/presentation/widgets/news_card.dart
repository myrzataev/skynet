import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:skynet/core/consts/app_fonts.dart';

class CustomNewsCard extends StatelessWidget {
  final String image;
  final String title;
  final String news;
  final String date;
  final bool isRead;
  const CustomNewsCard({
    super.key,
    required this.image,
    required this.title,
    required this.news,
    required this.date,
    required this.isRead,
  });

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('HH:mm   yyyy-MM-dd').format(dateTime);
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h, left: 5.w, right: 5.w),
      child: Container(
        width: double.infinity,
        height: 100.h,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.2,
                blurRadius: 2,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
            color: isRead ? Colors.white : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(15.r)),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10.r),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                child: Image.network(
                  image,
                  height: 70.h,
                  width: 70.w,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 10, right: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppFonts.s14w700.copyWith(color: Colors.black),
                      textAlign: TextAlign.start,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.visible,
                    ),
                    Text(
                      news,
                      style: AppFonts.s12w500,
                      textAlign: TextAlign.start,
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Text(
                      "Опубликовано: $formattedDate",
                      style: AppFonts.s10w500,
                    ),
                    SizedBox(
                      height: 5.h,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
