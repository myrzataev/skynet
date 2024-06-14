import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class CustomActivationButton extends StatelessWidget {
  final Widget childWidget;
  final double height;
  const CustomActivationButton({
    super.key,
    required this.childWidget, required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: height,
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
        child: Center(
          child: childWidget,
        ));
  }
}
