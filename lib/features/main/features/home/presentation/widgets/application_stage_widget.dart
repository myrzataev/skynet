import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/custom_dash_line.dart';
import 'package:skynet/resources/resources.dart';

class ApplicationStageWidget extends StatelessWidget {
  final int currentStage;
  const ApplicationStageWidget({super.key, required this.currentStage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < 3; i++)
          Expanded(
            child: Container(
              margin:
                  EdgeInsets.symmetric(vertical: 2.w), // Spacing between bars
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: ImageIcon(
                          const AssetImage(Images.tickForStage),
                          size: i > currentStage ? 14 : 20,
                          color: i > currentStage
                              ? const Color(0xffCDCDCD)
                              : const Color(0xff77C229),
                        ),
                      ),
                      Text(currentStageDescription(stage: i),
                          style: i > currentStage
                              ? AppFonts.s14w700
                                  .copyWith(color: const Color(0xffCDCDCD))
                              : AppFonts.s20w500.copyWith(
                                  color: const Color(0xff77C229),
                                  fontSize: currentStage == i ? 20 : 14)),
                    ],
                  ),
                  i < 2
                      ? Padding(
                          padding: EdgeInsets.only(left: 10.w, top: 10.h),
                          child: CustomPaint(
                            size: Size(1.w, 20.h),
                            painter: DashedLineVerticalPainter(
                                isCompleted: i < currentStage),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
      ],
    );
  }

  String currentStageDescription({required int stage}) {
    switch (stage) {
      case 0:
        return "Наряд создан";
      case 1:
        return "Наряд в работе";
      case 2:
        return "Наряд выполнен";
      default:
        return "";
    }
  }
}
