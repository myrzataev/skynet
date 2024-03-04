import 'package:flutter/material.dart';
import 'package:skynet/core/consts/app_fonts.dart';

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
        Text(
          "Баланс:",
          style: AppFonts.s16w700.copyWith(
              color: isPositive
                  ? const Color(0xff77C229)
                  : const Color(0xffFF3B30)),
        ),
        Text(
          "$balance с",
          style: AppFonts.s24w700.copyWith(
              color: isPositive
                  ? const Color(0xff77C229)
                  : const Color(0xffFF3B30)),
        )
      ],
    );
  }
}
