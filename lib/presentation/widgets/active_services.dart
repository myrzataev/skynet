import 'package:flutter/material.dart';
import 'package:skynet/core/consts/app_fonts.dart';

class ActiveServices extends StatelessWidget {
  final String serviceName;
  final bool isPaid;
  final String imageOfService;
  const ActiveServices({
    super.key,
    required this.serviceName,
    required this.isPaid,
    required this.imageOfService,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.054),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              imageOfService,
              height: MediaQuery.of(context).size.height * 0.05,
              width:MediaQuery.of(context).size.width*0.12 ,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                serviceName,
                style: AppFonts.s14w500,
              ),
              Text(
                isPaid ? "Оплачено" : "Не плачено",
                style: AppFonts.s14w700,
              )
            ],
          )
        ],
      ),
    );
  }
}
