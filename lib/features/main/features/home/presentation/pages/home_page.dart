import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/core/services/clipboard_copy.dart';
import 'package:skynet/core/services/service_locator.dart';
import 'package:skynet/core/services/shared_preferences_provider.dart';
import 'package:skynet/features/authorization/presentation/blocs/internet_cubit/internet_cubit.dart';
import 'package:skynet/features/authorization/presentation/screens/connectivity_widget.dart';
import 'package:skynet/features/main/features/home/data/models/stories_model.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/application_status_bloc/application_status_bloc.dart';
import 'package:skynet/features/main/features/home/presentation/providers/check_internet_connection.dart';
import 'package:skynet/features/main/features/home/presentation/providers/profile_info_provider.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/personal_details_bloc/get_personal_details_bloc.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/stories_bloc/stories_bloc.dart';
import 'package:skynet/features/main/features/home/presentation/pages/customer_support.dart';
import 'package:skynet/features/main/features/home/presentation/pages/pay_for_internet_page.dart';
import 'package:skynet/features/main/features/home/presentation/pages/story_screen.dart';
import 'package:skynet/features/main/features/home/presentation/pages/trust_payment_page.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/active_services.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/apllication_status_container.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/application_status_widget.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/custom_appbar.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/custom_container.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/custom_pay_button.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/custom_stories_shimmer.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/custom_error_widget.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/get_application_status_title.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/history_operation_button.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/home_page_shimmer.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/licevoi_shet.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/shimmer_container.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/show_balance.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/stories_widget.dart';
import 'package:skynet/features/main/features/news/presentation/blocs/cubit/mark_as_viewed_cubit.dart';
import 'package:skynet/features/main/features/news/presentation/blocs/local_news_bloc/localnews_bloc.dart';
import 'package:skynet/features/main/features/news/presentation/widgets/local_news_dialog.dart';
import 'package:skynet/resources/resources.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({required Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final SharedPreferences prefs = SharedPreferencesRepository().prefs;
  bool? hasNewNotification;

  @override
  bool get wantKeepAlive => true;
  bool isConnected = true;
  Future<void> _checkForUpdates() async {
    InAppUpdate.checkForUpdate().then((info) {
      setState(() {
        if (info.updateAvailability == UpdateAvailability.updateAvailable) {
          update();
        }
      });
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  void update() async {
    await InAppUpdate.startFlexibleUpdate();
    InAppUpdate.completeFlexibleUpdate().then((_) {}).catchError((e) {
      debugPrint(e.toString());
    });
  }

  @override
  void initState() {
    _checkForUpdates();
    super.initState();

    BlocProvider.of<GetPersonalDetailsBloc>(context)
        .add(GetPersonalDetailEvent());
    BlocProvider.of<StoriesBloc>(context).add(GetStoriesEvent());
    BlocProvider.of<ApplicationStatusBloc>(context)
        .add(GetApplicationStatusEvent());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<InternetCubit, InternetState>(
      /// this cubit checks for internet is it working or not, if not it will show ConnectivityOverlay widget on bottom of Screen
      listener: (context, state) {
        if (state is InternetDisconnected) {
          context
              .read<CheckInternetConnectionProvider>()
              .internetConnected(value: false);
        } else {
          context
              .read<CheckInternetConnectionProvider>()
              .internetConnected(value: true);
        }
      },
      child: ConnectivityOverlay(
          isConnected:
              context.watch<CheckInternetConnectionProvider>().isConnected,
          child: Scaffold(
            key: _scaffoldKey,
            body: BlocConsumer<GetPersonalDetailsBloc, GetPersonalDetailsState>(
              listener: (context, state) {
                if (state is GetPersonalDetailsSuccess) {
                  context
                      .read<GetProfileInfoProvider>()
                      .getNameAddress(state.model);
                  BlocProvider.of<LocalnewsBloc>(context)
                      .add(GetLocalnewsEvent());
                }
              },
              builder: (context, state) {
                if (state is GetPersonalDetailsSuccess) {
                  return BlocListener<LocalnewsBloc, LocalnewsState>(
                    listener: (context, state) {
                      if (state is LocalnewsSuccess) {
                        if (state.model.isNotEmpty) {
                          BlocProvider.of<MarkAsViewedCubit>(context)
                              .markAsViewed(
                                  postId: state.model.last.id.toString(),
                                  postType: state.model.last.postType ?? "");

                          return openFullscreenNews(
                              newsItem: state.model.last, context: context);
                        }
                      } else if (state is LocalnewsLoading) {
                      } else {}
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomAppBar(
                            isNotificationReceived: true,
                            nameSurName: state.model.name ?? "",
                            address: state.model.address?.first ?? "",
                          ),
                          Expanded(
                            child: RefreshIndicator.adaptive(
                              onRefresh: () async {
                                BlocProvider.of<GetPersonalDetailsBloc>(context)
                                    .add(GetPersonalDetailEvent());
                                BlocProvider.of<StoriesBloc>(context)
                                    .add(GetStoriesEvent());
                                BlocProvider.of<ApplicationStatusBloc>(context)
                                    .add(GetApplicationStatusEvent());
                              },
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                padding: EdgeInsetsDirectional.zero,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.w),
                                    child: SizedBox(
                                        height: 130.h,
                                        width: double.infinity,
                                        child: BlocBuilder<StoriesBloc,
                                            StoriesState>(
                                          builder: (context, state) {
                                            if (state is StoriesLoading) {
                                              return const CustomStoriesShimmer();
                                            } else if (state
                                                is StoriesSuccess) {
                                              // ignore: unused_local_variable
                                              List<StoryModel> storiesList =
                                                  state.stories.toList();

                                              return Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 15.h),
                                                  child: SizedBox(
                                                    height: 100.h,
                                                    width: double.infinity,
                                                    child: BlocBuilder<
                                                        StoriesBloc,
                                                        StoriesState>(
                                                      builder:
                                                          (context, state) {
                                                        if (state
                                                            is StoriesSuccess) {
                                                          List<StoryModel>
                                                              storiesList =
                                                              state.stories
                                                                  .toList();
                                                          List<UserModel>
                                                              userList = [
                                                            for (int i = 0;
                                                                i <
                                                                    storiesList
                                                                        .length;
                                                                i++)
                                                              UserModel(
                                                                  stories: [
                                                                    StoryModelTest(
                                                                        storiesList[i]
                                                                            .image)
                                                                  ])
                                                          ];
                                                          return ListView
                                                              .builder(
                                                                  scrollDirection:
                                                                      Axis
                                                                          .horizontal,
                                                                  itemCount: state
                                                                      .stories
                                                                      .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    return Padding(
                                                                      padding: EdgeInsets.only(
                                                                          right:
                                                                              13.w),
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                  builder: (context) => StoriesScreen(
                                                                                        userList: userList,
                                                                                        storyIndex: index,
                                                                                      )));
                                                                        },
                                                                        child:
                                                                            StoriesWidget(
                                                                          image:
                                                                              storiesList[index].icon,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  });
                                                        } else if (state
                                                            is StoriesLoading) {
                                                          return const Center(
                                                            child:
                                                                CircularProgressIndicator(),
                                                          );
                                                        }
                                                        return const SizedBox();
                                                      },
                                                    ),
                                                  ));
                                            } else if (state is StoriesError) {
                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 15.h),
                                                child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: 3,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 13.w),
                                                          child: Container(
                                                            height: 100.h,
                                                            width: 150.w,
                                                            decoration: BoxDecoration(
                                                                color: const Color(
                                                                    0xffCDCDCD),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.r)),
                                                            child: Center(
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  ImageIcon(
                                                                    const AssetImage(
                                                                        Images
                                                                            .attention),
                                                                    size: 30.h,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  Text(
                                                                    "Не удалось загрузить",
                                                                    style: AppFonts
                                                                        .s10w500,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ));
                                                    }),
                                              );
                                            }
                                            return const SizedBox();
                                          },
                                        )),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25.w),
                                    child: Container(
                                      height: 365.h,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 0.2,
                                            blurRadius: 7.r,
                                            offset: const Offset(0,
                                                0.5), // changes position of shadow
                                          ),
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 14.w, vertical: 20.h),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              children: [
                                                LicevoiShetWidget(
                                                  onTap: () {
                                                    final copyToClipboard =
                                                        locator<
                                                            CopyToClipboard>();
                                                    copyToClipboard
                                                        .copytoClipboard(
                                                            text: state.model.ls
                                                                .toString());
                                                  },
                                                  licevoiShet: int.tryParse(
                                                          state.model.ls
                                                              .toString()) ??
                                                      0,
                                                ),
                                                const Spacer(),
                                                ShowBalanceWidget(
                                                  isPositive: double.parse(state
                                                                  .model
                                                                  .balance ??
                                                              "") >=
                                                          0
                                                      ? true
                                                      : false,
                                                  balance:
                                                      state.model.balance ?? "",
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15.h),
                                              child: HistoryOperationButton(
                                                summ: state.model.nSum ?? "",
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                CustomContainer(
                                                  image:
                                                      Images.doveritelnyiplateg,
                                                  description:
                                                      "Доверительный платеж",
                                                  minidesccription:
                                                      "доступно 3 дня",
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            fullscreenDialog:
                                                                true,
                                                            builder: (context) =>
                                                                const TrustPaymentPage()));
                                                  },
                                                ),
                                                const Spacer(),
                                                CustomContainer(
                                                  image: Images.callcenter,
                                                  description:
                                                      "Чат с техподдержкой",
                                                  minidesccription:
                                                      "Онлайн 24/7",
                                                  onTap: () async {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const CustomerSupportScreen()));
                                                  },
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 10.h),
                                              child: PayButton(
                                                onTap: () => (Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const PayForInternetPage()))),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  BlocBuilder<ApplicationStatusBloc,
                                      ApplicationStatusState>(
                                    builder: (context, state) {
                                      if (state is ApplicationStatusLoading) {
                                        return CustomShimmerContainer(
                                            height: 85.h,
                                            width: 340.w,
                                            radius: 15.r);
                                      } else if (state
                                          is ApplicationStatusSuccess) {
                                        return SizedBox(
                                          height:
                                              ((state.entity.length) * 110.h),
                                          width: 100,
                                          child: ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              padding:
                                                  EdgeInsetsDirectional.zero,
                                              scrollDirection: Axis.vertical,
                                              itemCount: state.entity.length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 20.h,
                                                      left: 25.w,
                                                      right: 25.w),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      context.go(
                                                          "/bottomNavigation/applicationStatusScreen",
                                                          extra: state
                                                              .entity[index]);
                                                    },
                                                    child:
                                                        CustomApplicationStatusWidget(
                                                      statusId: int.parse(state
                                                              .entity[index]
                                                              .stageId ??
                                                          ""),
                                                      statusOfApplicationDescription:
                                                          Text(
                                                        GetApplicationStatusService
                                                            .currentStageDescription(
                                                                stage: int.parse(state
                                                                        .entity[
                                                                            index]
                                                                        .stageId ??
                                                                    "0")),
                                                        maxLines: 3,
                                                        softWrap: true,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: AppFonts.s12w500
                                                            .copyWith(
                                                                color: const Color(
                                                                    0xff77C229)),
                                                      ),
                                                      statusOfApplicationProgessBar:
                                                          CustomProgressIndicator(
                                                              currentStage: int
                                                                  .parse(state
                                                                          .entity[
                                                                              index]
                                                                          .stageId ??
                                                                      "0")),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        );
                                      }
                                      return const SizedBox();
                                    },
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 20.h, left: 25.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Подключенные услуги:",
                                          style: AppFonts.s22w700,
                                        ),
                                        (state.model.services?.isEmpty ?? true)
                                            ? Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8.0.h,
                                                    horizontal: 5.w),
                                                child: Text(
                                                  "Услуги интернета  не подключены так, как  вы не оплатили за текущий месяц",
                                                  style: AppFonts.s14w700
                                                      .copyWith(
                                                          color: const Color(
                                                              0xff808080)),
                                                ),
                                              )
                                            : SizedBox(
                                                height: ((state.model.services
                                                            ?.length ??
                                                        0) *
                                                    73.h),
                                                child: ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    itemCount: state
                                                        .model.services?.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return ActiveServices(
                                                          priceOfTarif: state
                                                                  .model
                                                                  .services?[
                                                                      index]
                                                                  .price
                                                                  .toString() ??
                                                              "",
                                                          imageOfService:
                                                              Images.internet,
                                                          serviceName: state
                                                              .model
                                                              .services?[index]
                                                              .name,
                                                          status: state
                                                                  .model
                                                                  .services?[
                                                                      index]
                                                                  .state ??
                                                              "");
                                                    }),
                                              ),
                                        // ElevatedButton(
                                        //     onPressed: () {
                                        //       print(
                                        //           state.model.services?.length);
                                        //     },
                                        //     child: Text("dsadfw"))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  );
                } else if (state is GetPersonalDetailsLoading) {
                  return const HomePageShimmerPage();
                } else if (state is GetPersonalDetailsError) {
                  // return Text(state.errorText);
                  return Center(child: CustomErrorWidget(
                    onTap: () async {
                      setState(() {
                        BlocProvider.of<GetPersonalDetailsBloc>(context)
                            .add(GetPersonalDetailEvent());
                      });
                    },
                  ));
                }
                return const SizedBox();
              },
            ),
          )),
    );
  }

  // bool hasNewNotificationMethod() {
  //   int? hasNewNotifications = prefs.getInt("notifsLength");
  //   if (hasNewNotifications != null) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
