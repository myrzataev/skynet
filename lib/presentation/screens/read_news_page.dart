import 'package:flutter/material.dart';
import 'package:skynet/core/consts/app_fonts.dart';

class ReadNewsPage extends StatelessWidget {
  final String title;
  final String text;
  const ReadNewsPage({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Новости",
          style: AppFonts.s20w500.copyWith(color: Colors.black),
        ),
        backgroundColor: const Color(0xffFCE6F1),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              title,
              style: AppFonts.s20w500.copyWith(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(text, style: AppFonts.s14w500),
          )
        ],
      ),
    );
  }
}
