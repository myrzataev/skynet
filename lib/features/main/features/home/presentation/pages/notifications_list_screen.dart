import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/core/services/shared_preferences_provider.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/get_notifications_list_bloc/get_notifications_list_bloc.dart';
import 'package:skynet/features/main/features/home/presentation/pages/notification_detailed_read.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/custom_error_widget.dart';

class NotificationsListScreen extends StatefulWidget {
  const NotificationsListScreen({super.key});

  @override
  State<NotificationsListScreen> createState() =>
      _NotificationsListScreenState();
}

class _NotificationsListScreenState extends State<NotificationsListScreen> {
  final SharedPreferences prefs = SharedPreferencesRepository().prefs;

  @override
  void initState() {
    callBloc();
    super.initState();
  }

  void callBloc() {
    BlocProvider.of<GetNotificationsListBloc>(context)
        .add(GetNotificationsListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: const Text("Уведомления"),
      ),
      body: BlocBuilder<GetNotificationsListBloc, GetNotificationsListState>(
        builder: (context, state) {
          if (state is GetNotificationsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetNotificationsSuccess) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.2,
                      blurRadius: 7.r,
                      offset:
                          const Offset(0, 0.5), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: ListView.builder(
                    itemCount: state.model.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading:
                            const Icon(Icons.circle_notifications_outlined),
                        // Image.asset(
                        //   Images.notific,
                        //   height: 35.h,
                        // ),
                        title: Text(state.model[index].title ?? ""),
                        subtitle: Text(
                          state.model[index].createdAt ?? "",
                          style: AppFonts.s8w500.copyWith(fontSize: 12.sp),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ReadDetailedNotification(
                                        id: state.model[index].id ?? 0,
                                        title: state.model[index].title ?? "",
                                        description:
                                            state.model[index].text ?? "",
                                        createdAt:
                                            state.model[index].createdAt ?? "",
                                      )));
                        },
                        trailing: SizedBox(
                          width: 50.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              (state.model[index].viewed == true)
                                  ? const SizedBox()
                                  : CircleAvatar(
                                      radius: 5.r,
                                      backgroundColor: Colors.yellow,
                                    ),
                              const Icon(Icons.arrow_right),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            );
          } else if (state is GetNotificationsError) {
            return Center(
              child: CustomErrorWidget(
                onTap: () {
                  BlocProvider.of<GetNotificationsListBloc>(context)
                      .add(GetNotificationsListEvent());
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
