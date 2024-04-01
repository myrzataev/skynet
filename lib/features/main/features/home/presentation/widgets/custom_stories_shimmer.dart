import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/shimmer_container.dart';

class CustomStoriesShimmer extends StatelessWidget {
  const CustomStoriesShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      width: 390.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(right: 10.w, top: 15.h, bottom: 15.h, left: 15.w),
          child: CustomShimmerContainer(
              height: 100.h, width: 150.w, radius: 12.r),
        ),
      ),
    );
  }
}
