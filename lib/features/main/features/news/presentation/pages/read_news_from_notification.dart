import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/features/authorization/presentation/screens/connectivity_widget.dart';
import 'package:skynet/features/main/features/home/presentation/providers/check_internet_connection.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/gradient_appbar.dart';
import 'package:skynet/resources/resources.dart';

@RoutePage()
class ReadNewsPageFromNotification extends StatefulWidget {
  final String title;

  final String body;
  const ReadNewsPageFromNotification({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  State<ReadNewsPageFromNotification> createState() =>
      _ReadNewsPageFromNotificationState();
}

class _ReadNewsPageFromNotificationState
    extends State<ReadNewsPageFromNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              context.pop();
              // Navigator.of(context).pushNamedAndRemoveUntil(
              //     '/bottomNavigation', (Route<dynamic> route) => false);
            },
            icon: const ImageIcon(AssetImage(Images.closeicon))),
        title: Text(
          "Новости",
          style: AppFonts.s20w500.copyWith(color: Colors.white),
        ),
        flexibleSpace: const GradientAppBar(),
      ),
      body: ConnectivityOverlay(
        isConnected:
            context.watch<CheckInternetConnectionProvider>().isConnected,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                widget.title,
                style: AppFonts.s20w500.copyWith(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(widget.body,
                  style: AppFonts.s14w500
                      .copyWith(color: const Color(0xff808080))),
            )
          ],
        ),
      ),
    );
  }
}
