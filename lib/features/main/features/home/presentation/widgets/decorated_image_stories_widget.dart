import 'package:flutter/material.dart';

class DecoratedImageWidget extends StatelessWidget {
  final String imageName;

  const DecoratedImageWidget({
    Key? key,
    required this.imageName,
  }) : super(key: key);

  BoxDecoration _buildButtonDecoration(String imageName) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        image: NetworkImage(imageName),
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      decoration: _buildButtonDecoration(imageName),
    );
  }
}
