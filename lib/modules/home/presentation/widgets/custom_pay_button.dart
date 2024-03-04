import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/modules/home/presentation/screens/pay_for_internet_page.dart';
import 'package:skynet/resources/resources.dart';

class PayButton extends StatelessWidget {
  const PayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const PayForInternetPage()));
      },
      child: Container(
        height: MediaQuery.of(context).size.height*0.068,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            border: const GradientBoxBorder(
              gradient: LinearGradient(
                  colors: [Color(0xffFD4417), Color(0xff8A2783)]),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0.1,
                blurRadius: 7,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ]),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 25, vertical: MediaQuery.of(context).size.height*0.0055),
          child: Row(
            children: [
              Image.asset(
                Images.wallet,
                height: MediaQuery.of(context).size.height*0.083,
                width: MediaQuery.of(context).size.height*0.038,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Оплатить за интернет",
                      style: AppFonts.s14w500,
                    ),
                    Text(
                      "Онлайн перевод",
                      style: AppFonts.s10w500,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
