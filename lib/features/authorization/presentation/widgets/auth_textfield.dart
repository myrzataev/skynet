import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skynet/core/consts/app_fonts.dart';

class CustomAuthTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData suffixIcon;
  final FocusNode focusNode;
  const CustomAuthTextField({
    super.key, required this.hintText, required this.controller, required this.suffixIcon, required this.focusNode,
  });

  @override
  State<CustomAuthTextField> createState() => _CustomAuthTextFieldState();

}


class _CustomAuthTextFieldState extends State<CustomAuthTextField> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 5.h),
      child: SizedBox(
     
        child: TextField(
          focusNode: widget.focusNode,
          // expands: true,
       
          keyboardType: TextInputType.number,
          controller: widget.controller,
          
          style: AppFonts.s18w500,
          decoration: InputDecoration(
              suffixIcon:  Icon(
                widget.suffixIcon,
                color: const Color(0xff808080),
                size: 23.h,
              ),
              fillColor: Colors.white,
              hintText: widget.hintText,
              hintStyle:  TextStyle(
                color: const Color(0xffC0C0C0),
                fontSize: ScreenUtil().setSp(18),
              ),
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
