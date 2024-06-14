import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/resources/resources.dart';

class CustomApplicationStatusWidget extends StatelessWidget {
  final int statusId;
  final Widget statusOfApplicationDescription;
  final Widget statusOfApplicationProgessBar;
  const CustomApplicationStatusWidget({
    super.key,
    required this.statusId,
    required this.statusOfApplicationDescription,
    required this.statusOfApplicationProgessBar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      height: 90.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.2,
              blurRadius: 7.r,
              offset: const Offset(0, 0.5), // changes position of shadow
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: Image.asset(
                  Images.config,
                  height: 48.h,
                  width: 48.w,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Статус Вашей заявки:",
                      style: AppFonts.s16w400,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                    statusOfApplicationDescription,
                  ],
                ),
              ),
            ],
          ),
          statusOfApplicationProgessBar
          // CustomProgressIndicator(currentStage: statusId),
        ],
      ),
    );
  }

  String getApplicationStatusTitle({required int idStatus}) {
    switch (idStatus) {
      case 0:
        return "Наряд создан и находится на рассмотрении";
      case 1:
        return "Наряд принят в работу, ожидайте звонка";
      case 2:
        return "Наряд выполнен! Просьба оставить оценку и отзыв";
      default:
        return "Ошибка";
    }
  }
}
