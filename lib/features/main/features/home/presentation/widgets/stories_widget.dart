import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class StoriesWidget extends StatelessWidget {
  final String? image;
  const StoriesWidget({
    super.key,
     this.image,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: GradientBoxBorder(
            gradient: const LinearGradient(colors: [
              Color(0xff8A2783),
              Color(0xffFD4417),
            ]),
            width: 2.w,
          ),
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(image??""))),
    );
  }
}
