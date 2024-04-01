import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/features/main/features/news/data/models/local_news_model.dart';

void openFullscreenNews(
    {required LocalNewsModel newsItem, required BuildContext context}) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.7), // Задний фон полупрозрачный
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        insetAnimationDuration: const Duration(microseconds: 10),
        insetPadding:
            EdgeInsets.all(10.w), // Увеличение размера модального окна
        child: Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height *
                  2), // Ограничение по высоте
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Заголовок новости
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    newsItem.title ?? 'Заголовок неизвестен',
                    style: AppFonts.s20w500.copyWith(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(30.0.r), // Радиус скругления
                    child: Image.network(
                      newsItem.image ?? "",
                      // height: 200.h,
                      // width: 200.w,
                    ),
                  ),
                ),
                // Текст новости
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    newsItem.text ?? 'Текст отсутствует',
                    style: AppFonts.s14w500,
                  ),
                ),
                // Кнопка закрытия
                TextButton(
                  child: const Text('Закрыть'),
                  onPressed: () => context.pop(),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
