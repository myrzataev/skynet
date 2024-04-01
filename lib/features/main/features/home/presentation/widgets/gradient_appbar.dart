
import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  const GradientAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
    decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
      Color(0xffFD4417),
      Color(0xffEC0478),
    ])),
            );
  }
}
