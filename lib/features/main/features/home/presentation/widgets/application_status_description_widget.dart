import 'package:flutter/material.dart';
import 'package:skynet/core/consts/app_fonts.dart';

class ApplicationStatusDescriptionWidget extends StatelessWidget {
  final String description;
  const ApplicationStatusDescriptionWidget({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Text(description,
        maxLines: 3,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style: AppFonts.s12w500.copyWith(color: Colors.red));
  }
}
