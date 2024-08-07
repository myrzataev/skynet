import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/get_notifications_list_bloc/get_notifications_list_bloc.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/mark_notification_as_viewed_bloc/mark_notification_as_viewed_bloc.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/gradient_appbar.dart';

class ReadDetailedNotification extends StatefulWidget {
  final int id;
  final String title;
  final String description;
  final String createdAt;
  const ReadDetailedNotification(
      {super.key,
      required this.id,
      required this.description,
      required this.title,
      required this.createdAt});

  @override
  State<ReadDetailedNotification> createState() =>
      _ReadDetailedNotificationState();
}

class _ReadDetailedNotificationState extends State<ReadDetailedNotification> {
  @override
  void initState() {
    callBloc();
    super.initState();
  }

  void callBloc() {
    BlocProvider.of<MarkNotificationAsViewedBloc>(context)
        .add(MarkNotificationAsViewedEventFromUI(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Уведомление",
          style: AppFonts.s20w500.copyWith(color: Colors.white),
        ),
        flexibleSpace: const GradientAppBar(),
      ),
      body: BlocListener<MarkNotificationAsViewedBloc,
          MarkNotificationAsViewedState>(
        listener: (context, state) {
          if (state is MarkNotificationAsViewedSuccess) {
            BlocProvider.of<GetNotificationsListBloc>(context)
                .add(GetNotificationsListEvent());
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: AppFonts.s20w500.copyWith(color: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Text(
                  widget.createdAt,
                  style: AppFonts.s8w500.copyWith(fontSize: 12.sp),
                ),
              ),
              Text(
                widget.description,
                style:
                    AppFonts.s14w500.copyWith(color: const Color(0xff808080)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
