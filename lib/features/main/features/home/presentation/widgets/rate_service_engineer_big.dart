
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/core/services/open_dialer.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/send_feedback/send_feed_back_bloc.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/custom_activation_button.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/rate_service_engineer_text_field.dart';
import 'package:skynet/resources/resources.dart';

class RateServiceEngineerExpandedWidget extends StatefulWidget {
  final String phoneNumber;
  final String nameSurName;
  final String photo;
  final String id;
  const RateServiceEngineerExpandedWidget({
    super.key,
    required this.phoneNumber,
    required this.nameSurName,
    required this.photo,
    required this.id,
  });

  @override
  State<RateServiceEngineerExpandedWidget> createState() =>
      _RateServiceEngineerExpandedWidgetState();
}

class _RateServiceEngineerExpandedWidgetState
    extends State<RateServiceEngineerExpandedWidget> {
  double ratingInitial = 1;
  final TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370.h,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.network(
                    widget.photo,
                    height: 54.h,
                    width: 54.w,
                  ),
                ),
                SizedBox(
                  width: 220.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Сервис-инженер:",
                        style: AppFonts.s10w500,
                      ),
                      Text(
                        widget.nameSurName,
                        style: AppFonts.s16w400,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        widget.phoneNumber,
                        style: AppFonts.s12w500,
                      )
                    ],
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      OpenDialer.launchCaller(urlL: widget.phoneNumber);
                    },
                    child: Ink(
                      height: 46.h,
                      width: 46.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Colors.white,
                          border: GradientBoxBorder(
                            gradient: const LinearGradient(
                                colors: [Color(0xffFD4417), Color(0xff8A2783)]),
                            width: 2.w,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 0.1.r,
                              blurRadius: 7.r,
                              offset:
                                  Offset(0, 2.h), // changes position of shadow
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          Images.serviceEngineerNumber,
                          height: 10.h,
                          width: 10.w,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(
            "Просьба оставить оценку выполненной работы:",
            style: AppFonts.s12w500.copyWith(color: Colors.black),
          ),
          RatingBar.builder(
            initialRating: 1,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemSize: 30,
            itemPadding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
            itemBuilder: (context, _) => const ImageIcon(
              AssetImage(Images.ratingStar),
              color: Color(0xffFFDF00),
            ),
            onRatingUpdate: (rating) {
              ratingInitial = rating;
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: RateServiceEngineerTextField(
              controller: controller,
            ),
          ),
          BlocListener<SendFeedBackBloc, SendFeedBackState>(
            listener: (context, state) {
              if (state is SendFeedBackLoading) {
                context.loaderOverlay.show();
              } else if (state is SendFeedBackSuccess) {
                context.loaderOverlay.hide();
                QuickAlert.show(
                  context: context,
                  title: "Успех",
                  type: QuickAlertType.success,
                  text: "Мы получили ваш отзыв",
                  barrierDismissible: true,
                  confirmBtnText: "Ок",
                  onConfirmBtnTap: () {
                    Navigator.pop(context);
                  },
                );
              } else {
                context.loaderOverlay.hide();
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: InkWell(
                onTap: () {
                  BlocProvider.of<SendFeedBackBloc>(context).add(
                      SendFeedBackEvent(
                          bxId: widget.id,
                          feedBackMark: ratingInitial.toString(),
                          feedBackText: controller.text));
                },
                child: CustomActivationButton(
                  childWidget: Text(
                    "Оценить",
                    style: AppFonts.s14w500,
                  ),
                  height: 50.h,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
