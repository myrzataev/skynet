import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:skynet/core/consts/app_fonts.dart';

class CustomContainer extends StatelessWidget {
  final String image;
  final String description;
  final String minidesccription;
  final VoidCallback onTap;

  const CustomContainer(
      {super.key,
      required this.image,
      required this.description,
      required this.minidesccription,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.14,
        width: MediaQuery.of(context).size.width * 0.40,
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
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.028,
              vertical: MediaQuery.of(context).size.height * 0.013),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset(
              image,
              height: MediaQuery.of(context).size.height * 0.038,
              width: MediaQuery.of(context).size.width * 0.083,
            ),
            AutoSizeText(
              description,
              style: AppFonts.s14w500,
              maxLines: 2,
              softWrap: true,
            ),
            AutoSizeText(
              minidesccription,
              style: AppFonts.s10w500,
              softWrap: true,
            )
          ]),
        ),
      ),
    );
  }
}
