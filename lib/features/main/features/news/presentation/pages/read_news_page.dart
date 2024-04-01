import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/features/authorization/presentation/screens/connectivity_widget.dart';
import 'package:skynet/features/main/features/home/presentation/providers/check_internet_connection.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/gradient_appbar.dart';
import 'package:skynet/features/main/features/news/presentation/blocs/cubit/mark_as_viewed_cubit.dart';

@RoutePage()
class ReadNewsPage extends StatefulWidget {
  final String newsTitle;
  final String text;
  final String? image;
  final String postId;
  final String postType;
  const ReadNewsPage({
    super.key,
    required this.newsTitle,
    required this.text,
    required this.image,
    required this.postId,
    required this.postType,
  });

  @override
  State<ReadNewsPage> createState() => _ReadNewsPageState();
}

class _ReadNewsPageState extends State<ReadNewsPage> {
  void markAsViewed() async {
    BlocProvider.of<MarkAsViewedCubit>(context)
        .markAsViewed(postId: widget.postId, postType: widget.postType);
        print("sended successfully");
  }
  @override
  void initState() {
    markAsViewed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                widget.newsTitle,
                style: AppFonts.s20w500.copyWith(color: Colors.black),
              ),
            ),
            widget.image != null
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
                    child: Image.network(
                      widget.image!,
                      height: 300.h,
                      width: double.infinity,
                    ),
                  )
                : SizedBox(
                    height: 30.h,
                  ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(widget.text,
                  style: AppFonts.s14w500
                      .copyWith(color: const Color(0xff808080))),
            )
          ],
        ),
      ),
    );
  }
}
