import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skynet/config/app_info.dart';
import 'package:skynet/core/consts/app_consts.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/features/authorization/presentation/screens/connectivity_widget.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/application_status_bloc/application_status_bloc.dart';
import 'package:skynet/features/main/features/home/presentation/providers/check_internet_connection.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/pay_cubit/pay_cubit.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/gradient_appbar.dart';
import 'package:skynet/features/main/features/news/presentation/blocs/personal_news/personal_news_bloc.dart';
import 'package:skynet/features/main/features/profile/presentation/blocs/bloc/log_out_bloc.dart';
import 'package:skynet/features/main/features/profile/presentation/widgets/custom_more_widget.dart';
import 'package:skynet/resources/resources.dart';
import 'package:uiblock/uiblock.dart';

@RoutePage()
class MorePage extends StatefulWidget {
  const MorePage({required Key key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PersonalNewsBloc>(context).add(GetPersonalNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return ConnectivityOverlay(
      isConnected: context.watch<CheckInternetConnectionProvider>().isConnected,
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            "Еще",
            style: AppFonts.s20w500.copyWith(color: Colors.white),
          ),
          flexibleSpace: const GradientAppBar(),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomMoreWidget(
                  text: "Служба поддержки клиентов",
                  icon: Images.callcenter,
                  onTap: () async => BlocProvider.of<PayCubit>(context)
                      .payFromService(url: AppConsts.openWatsapp)),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Divider(
                  height: 1.h,
                ),
              ),
              CustomMoreWidget(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Вы действительно хотите выйти из системы?",
                            style: AppFonts.s14w500,
                          ),
                          actions: [
                            Center(
                              child: Column(
                                children: [
                                  BlocListener<LogOutBloc, LogOutState>(
                                    listener: (context, state) async {
                                      if (state is LogOutLoading) {
                                        UIBlock.block(
                                          context,
                                          canDissmissOnBack: true,
                                        );
                                      } else if (state is LogOutSuccess) {
                                        final SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        // ignore: use_build_context_synchronously
                                        UIBlock.unblock(context);
                                        prefs.clear();
                                        // ignore: use_build_context_synchronously
                                        context.pushReplacement("/");
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    "Не удалось выйти из системы")));
                                      }
                                    },
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red),
                                        onPressed: () async {
                                          BlocProvider.of<LogOutBloc>(context)
                                              .add(LogOutFromAccountEvent());
                                        },
                                        child: Text(
                                          "Выйти",
                                          style: AppFonts.s14w500
                                              .copyWith(color: Colors.white),
                                        )),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Отмена",
                                        style: AppFonts.s14w700
                                            .copyWith(color: Colors.black),
                                      ))
                                ],
                              ),
                            )
                          ],
                        );
                      });
                },
                text: "Выйти",
                icon: Images.logout,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    CustomMoreWidget(
                      onTap: () async {
                        BlocProvider.of<ApplicationStatusBloc>(context)
                            .add(GetApplicationStatusEvent());
                        
                      },
                      text: "Версия приложения",
                      icon: Images.quality,
                    ),
                    const Spacer(),
                    Text(
                      GlobalConfig.version,
                      style: AppFonts.s14w500
                          .copyWith(color: const Color(0xff808080)),
                    )
                  ],
                ),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}
