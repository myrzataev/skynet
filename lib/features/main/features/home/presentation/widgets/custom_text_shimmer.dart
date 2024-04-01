import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomTextShimmer extends StatelessWidget {
  const CustomTextShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
  width: 200.0,
  height: 100.0,
  child: Shimmer.fromColors(
    baseColor: Colors.red,
    highlightColor: Colors.yellow,
    child: const Text(
      'Shimmer',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 40.0,
        fontWeight:
        FontWeight.bold,
      ),
    ),
  ),
);
  }
}