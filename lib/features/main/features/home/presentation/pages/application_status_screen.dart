import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/features/main/features/home/domain/entity/application_status_entity.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/application_stage_widget.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/expandable_rate_container.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/expandable_text.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/get_application_status_title.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/rate_service_engineer_small.dart';

class ApplicationStatusScreen extends StatelessWidget {
  final ApplicationStatusEntity model;
  const ApplicationStatusScreen({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              GetApplicationStatusService.currentStagePhoto(
                  stage: int.parse(model.stageId ?? "0")),
              fit: BoxFit.fill,
              height: 300.h,
              width: double.infinity,
            ),
            Positioned(
                top: 42.h,
                left: 25.w,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                  iconSize: 30.h,
                )),
            DraggableScrollableSheet(
              initialChildSize: 440.h / 640.h,
              minChildSize: 440.h / 640.h,
              maxChildSize: 1,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30.r)),
                  ),
                  padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 15.0.h),
                        child: Container(color: Colors.green),
                      ),
                      Expanded(
                        child: CustomScrollView(
                          controller: scrollController,
                          slivers: [
                            SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 25.h, horizontal: 10.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Статус Вашей заявки:",
                                          style: AppFonts.s22w700,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 20.h),
                                          child: SizedBox(
                                              height: 200.h,
                                              child: ApplicationStageWidget(
                                                currentStage: int.parse(
                                                    model.stageId ?? "0"),
                                              )),
                                        ),
                                        int.parse(model.stageId ?? "0") > 0
                                            ? Padding(
                                                padding: EdgeInsets.only(
                                                  bottom: 30.0.h,
                                                ),
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.r),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 0.2,
                                                            blurRadius: 7.r,
                                                            offset: const Offset(
                                                                0,
                                                                0.5), // changes position of shadow
                                                          ),
                                                        ]),
                                                    child: int.parse(
                                                                model.stageId ??
                                                                    "") >
                                                            1
                                                        ? ExpandableRateContainer(
                                                            id: model.id ?? "",
                                                            photo: model
                                                                    .photo ??
                                                                "https://media.istockphoto.com/id/1337144146/vector/default-avatar-profile-icon-vector.jpg?s=612x612&w=0&k=20&c=BIbFwuv7FxTWvh5S3vB6bkT0Qv8Vn8N5Ffseq84ClGI=",
                                                            phoneNumber:
                                                                model.phone ??
                                                                    "",
                                                            executorNameSurname:
                                                                model.executor ??
                                                                    "",
                                                          )
                                                        : RateServiceEngineerSmallWidget(
                                                            phoneNumber:
                                                                model.phone ??
                                                                    "",
                                                            nameSurName: model
                                                                    .executor ??
                                                                "",
                                                            photo: model
                                                                    .photo ??
                                                                "https://media.istockphoto.com/id/1337144146/vector/default-avatar-profile-icon-vector.jpg?s=612x612&w=0&k=20&c=BIbFwuv7FxTWvh5S3vB6bkT0Qv8Vn8N5Ffseq84ClGI=",
                                                          )),
                                              )
                                            : const SizedBox(),
                                        Text(
                                          "Лицевой счет:",
                                          style: AppFonts.s16w700,
                                        ),
                                        Text(
                                          model.lsAbon ?? "",
                                          style: AppFonts.s16w400.copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "Gotham light"),
                                        ),
                                        const Divider(),
                                        Text(
                                          "Выезд к абоненту:",
                                          style: AppFonts.s16w700,
                                        ),
                                        Text(
                                          "Платный выезд",
                                          style: AppFonts.s16w400.copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "Gotham light"),
                                        ),
                                        const Divider(),
                                        Text(
                                          "Описание заявки:",
                                          style: AppFonts.s16w700,
                                        ),
                                        ExpandableText(
                                          text: model.description ?? "",
                                          style: AppFonts.s16w400.copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "Gotham light"),
                                          fadeTextStyle: AppFonts.s16w400
                                              .copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "Gotham light"),
                                        ),
                                        const Divider(),
                                        Text(
                                          "Тип работы:",
                                          style: AppFonts.s16w700,
                                        ),
                                        Text(
                                          model.title ?? "",
                                          style: AppFonts.s16w400.copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "Gotham light"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
