import 'package:flutter/material.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/resources/resources.dart';

class CustomNewsCard extends StatelessWidget {
  final String image;
  final String title;
  final String news;
  const CustomNewsCard({
    super.key,
    required this.image,
    required this.title,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: MediaQuery.of(context).size.height*0.115,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                Images.car,
                height: 70,
                width: 70,
              ),
            ),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.007, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppFonts.s14w700.copyWith(color: Colors.black),
                      textAlign: TextAlign.start,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.visible,
                    ),
                    Text(
                      news,
                      style: AppFonts.s12w500,
                      textAlign: TextAlign.start,
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
