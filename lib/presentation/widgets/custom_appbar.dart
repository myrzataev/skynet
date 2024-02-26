import 'package:flutter/material.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/resources/resources.dart';

class CustomAppBar extends StatelessWidget {
  final String nameSurName;
  final String address;
  const CustomAppBar({
    super.key,
    required this.nameSurName,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xffFCE6F1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.2,
              blurRadius: 7,
              offset: const Offset(0, 0.5), // changes position of shadow
            ),
          ],
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.only(top: 60, left: 25),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameSurName,
                  style: AppFonts.s24w700,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  address,
                  style: AppFonts.s12w500,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Image.asset(
              Images.logo,
              height: 37,
              width: 37,
            ),
          )
        ]),
      ),
    );
  }
}
