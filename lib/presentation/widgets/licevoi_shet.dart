import 'package:flutter/material.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/resources/resources.dart';

class LicevoiShetWidget extends StatefulWidget {
  final int licevoiShet;
 
  final VoidCallback? onTap;

  const LicevoiShetWidget(
      {super.key,
      required this.licevoiShet,
      this.onTap,
      });

  @override
  State<LicevoiShetWidget> createState() => _LicevoiShetWidgetState();
}

class _LicevoiShetWidgetState extends State<LicevoiShetWidget> {
   bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        "Лицевой счет:",
        style: AppFonts.s16w700,
      ),
      Container(
        height: 32,
        width: 170,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.2,
                blurRadius: 2,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text(
                widget.licevoiShet.toString(),
                style: AppFonts.s20w500,
              ),
              const Spacer(),
              InkWell(
                  onTap: () {
                    widget.onTap;
                    setState(() {
                     isPressed = !isPressed;
                    });
                     if (widget.onTap != null) {
                      widget.onTap!();
                    }
                  },
                  child: Image.asset(
                    isPressed ? Images.tick : Images.copylogo,
                    height: 20,
                    width: 20,
                    color: const Color(0xff808080),
                  ))
            ],
          ),
        ),
      )
    ]);
  }
}
