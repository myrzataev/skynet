import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProgressIndicator extends StatelessWidget {
  final int currentStage; // 0 for waiting, 1 for doing, 2 for done

  const CustomProgressIndicator({Key? key, required this.currentStage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 3; i++)
          Expanded(
            child: Container(
              height: 3.h, // Set the height of the indicator
              margin:  EdgeInsets.symmetric(horizontal: 2.w), // Spacing between bars
              decoration: BoxDecoration(
                color: i <= currentStage ? Colors.red : Colors.grey[300], // Active or inactive color
                borderRadius: BorderRadius.circular(5.r), // Round the corners
              ),
            ),
          ),
      ],
    );
  }
}
