import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skynet/core/consts/app_fonts.dart';

class TrustPaymentWidget extends StatelessWidget {
  final String logo;

  final String text;
  const TrustPaymentWidget({
    super.key,
    required this.logo,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            logo,
            height: 44.h,
            width: 44.w,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 70.h,
              child: Text(text,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  maxLines: 4,
                  style: AppFonts.s16w700),
            ),
          ),
        ],
      ),
    );
  }
}
