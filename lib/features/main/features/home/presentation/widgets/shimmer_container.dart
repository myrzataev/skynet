import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerContainer extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  const CustomShimmerContainer({super.key, required this.height,required this.width, required this.radius});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Shimmer.fromColors(
        highlightColor: Colors.grey.shade100,
        baseColor: Colors.grey.shade300,
        child: Container(
          
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius),color: Colors.white,),
        
        ),
      ),
    );
  }
}
