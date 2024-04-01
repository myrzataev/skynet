import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/resources/resources.dart';

class ConnectivityOverlay extends StatelessWidget {
  final Widget child;
  final bool isConnected;

  const ConnectivityOverlay({
    Key? key,
    required this.child,
    required this.isConnected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (!isConnected)
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 150.h, // Adjust the height as needed
                      decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25.r),
                              topRight:
                                  Radius.circular(25.r))), // Partially transparent
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              Images.connectionlost,
                              height: 70.h,
                              width: 70.w,
                              color: Colors.red,
                            ),
                            Text(
                              
                              "Нет связи",
                              style: AppFonts.s14w500.copyWith(color: Colors.red),
                            ),
                            Text(
                              "Проверьте интернет соединение",
                              style: AppFonts.s12w700.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
