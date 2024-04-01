import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/features/main/features/home/presentation/pages/transactions_page.dart';

class ShowBalanceWidget extends StatelessWidget {
  final String balance;
  final bool isPositive;
  const ShowBalanceWidget(
      {super.key, required this.balance, this.isPositive = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 7.h),
          child: Text(
            "Баланс:",
            style: AppFonts.s16w700.copyWith(
                color: isPositive
                    ? const Color(0xff77C229)
                    : const Color(0xffFF3B30)),
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 1,
          ),
        ),
        Container(
          alignment: Alignment.center,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.2,
                  blurRadius: 2,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ]),
          height: 32.h,
          width: 125.w,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TransactionsPage()));
              },
              child: Text(
                
                "$balance с",
                style: AppFonts.s24w700.copyWith(
                    color: isPositive
                        ? const Color(0xff77C229)
                        : const Color(0xffFF3B30)),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }
}
