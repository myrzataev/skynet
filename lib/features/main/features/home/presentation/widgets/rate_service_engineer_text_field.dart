
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skynet/core/consts/app_fonts.dart';

class RateServiceEngineerTextField extends StatelessWidget {
  final TextEditingController controller;
  const RateServiceEngineerTextField({
    super.key, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 5,
      style: AppFonts.s12w500.copyWith(color: Colors.black87),
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
        fillColor: const Color(0xffF2F2F2),
        filled: true,
        hintText: "Оставьте отзыв",
        hintStyle: AppFonts.s12w500,
      ),
    );
  }
}
