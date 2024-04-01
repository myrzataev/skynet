import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppFonts {
  static TextStyle s24w700 = TextStyle(
      fontSize: ScreenUtil().setSp(24),
      fontWeight: FontWeight.w700,
      color: Colors.black,
      fontFamily: "Gotham");
  static TextStyle s12w500 = TextStyle(
      fontSize: ScreenUtil().setSp(12),
      fontWeight: FontWeight.w500,
      color: Colors.black.withOpacity(0.5),
      fontFamily: "Gotham");
  static TextStyle s12w700 = TextStyle(
      fontSize: ScreenUtil().setSp(12),
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontFamily: "Gotham");
  static TextStyle s16w700 = TextStyle(
      fontSize: ScreenUtil().setSp(16),
      fontWeight: FontWeight.w700,
      color: Colors.black,
      fontFamily: "Gotham");
  static TextStyle s16w400 = TextStyle(
      fontSize: ScreenUtil().setSp(16),
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: "Gotham");
  static TextStyle s14w500 = TextStyle(
      fontSize: ScreenUtil().setSp(14),
      fontWeight: FontWeight.bold,
      // color: Colors.black,);
      fontFamily: "Gotham");
  static TextStyle s10w500 = TextStyle(
      fontSize: ScreenUtil().setSp(10),
      fontWeight: FontWeight.w500,
      color: Colors.black.withOpacity(0.5),
      fontFamily: "Gotham");
  static TextStyle s22w700 = TextStyle(
      fontSize: ScreenUtil().setSp(22),
      fontWeight: FontWeight.w700,
      color: Colors.black,
      fontFamily: "Gotham");
  static TextStyle s14w700 = TextStyle(
      fontSize: ScreenUtil().setSp(14),
      fontWeight: FontWeight.w700,
      color: const Color(0xff77C229),
      fontFamily: "Gotham");
  static TextStyle s20w500 = TextStyle(
      fontSize: ScreenUtil().setSp(20),
      fontWeight: FontWeight.w500,
      color: const Color(0xff808080),
      fontFamily: "Gotham");
  static TextStyle s26w700 = TextStyle(
      fontSize: ScreenUtil().setSp(26),
      fontWeight: FontWeight.w700,
      color: const Color(0xff808080),
      fontFamily: "Gotham");
  static TextStyle s11w500 = TextStyle(
      fontSize: ScreenUtil().setSp(11),
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: "Gotham");
  static TextStyle s32w700 = TextStyle(
      color: Colors.black,
      fontFamily: "Gotham",
      fontSize: ScreenUtil().setSp(32));
  static TextStyle s20w700 = TextStyle(
      color: const Color(0xff808080), fontSize: ScreenUtil().setSp(20));
  static TextStyle s17wnormal = TextStyle(
      fontWeight: FontWeight.normal,
      fontFamily: "Gotham",
      fontSize: ScreenUtil().setSp(17));
  static TextStyle s8w500 = TextStyle(
      fontSize: ScreenUtil().setSp(8),
      fontWeight: FontWeight.w500,
      color: Colors.black.withOpacity(0.5));
  static TextStyle s18w500 = TextStyle(
      color: Colors.black.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: ScreenUtil().setSp(18),
      fontFamily: "Gotham");
}
