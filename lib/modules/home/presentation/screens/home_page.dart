import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/modules/home/data/dummydata/storydata.dart';
import 'package:skynet/modules/home/data/providers/profile_info_provider.dart';
import 'package:skynet/modules/home/presentation/blocs/personal_details_bloc/get_personal_details_bloc.dart';
import 'package:skynet/modules/home/presentation/screens/story_screen.dart';
import 'package:skynet/modules/home/presentation/screens/trust_payment_page.dart';
import 'package:skynet/modules/home/presentation/widgets/active_services.dart';
import 'package:skynet/modules/home/presentation/widgets/custom_appbar.dart';
import 'package:skynet/modules/home/presentation/widgets/custom_container.dart';
import 'package:skynet/modules/home/presentation/widgets/custom_pay_button.dart';
import 'package:skynet/modules/home/presentation/widgets/history_operation_button.dart';
import 'package:skynet/modules/home/presentation/widgets/licevoi_shet.dart';
import 'package:skynet/modules/home/presentation/widgets/show_balance.dart';
import 'package:skynet/resources/resources.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  late double screenWidth;
  late double screenHeight;
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<GetPersonalDetailsBloc>(context)
        .add(GetPersonalDetailEvent());
  }

  @override
  Widget build(BuildContext context) {
    widget.screenWidth = MediaQuery.of(context).size.width;
    widget.screenHeight = MediaQuery.of(context).size.height;
    print(widget.screenWidth);
    print(widget.screenHeight);

    return Scaffold(
      body: BlocConsumer<GetPersonalDetailsBloc, GetPersonalDetailsState>(
        listener: (context, state) {
          if (state is GetPersonalDetailsSuccess) {
            context.read<GetProfileInfoProvider>().getNameAddress(state.model);
          }
        },
        builder: (context, state) {
          if (state is GetPersonalDetailsSuccess) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                    nameSurName: state.model.name,
                    address: state.model.address.toString(),
                  ),
                  Expanded(
                    child: RefreshIndicator.adaptive(
                      onRefresh: () async {
                        BlocProvider.of<GetPersonalDetailsBloc>(context)
                            .add(GetPersonalDetailEvent());
                      },
                      child: ListView(
                          padding: EdgeInsetsDirectional.zero,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 15, left: 15),
                                  child: SizedBox(
                                    height: 100,
                                    width: double.infinity,
                                    child: ListView.builder(
                                        padding: EdgeInsetsDirectional.zero,
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            StoryModelData.stories.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 7),
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              MyStoryPage(
                                                                listStoryModel:
                                                                    StoryModelData
                                                                        .stories,
                                                                currentUserId:
                                                                    index,
                                                              )));
                                                },
                                                child: Image.asset(
                                                  StoryModelData.stories[index]
                                                      .photoOrUrl[0],
                                                  height: 100,
                                                  width: 150,
                                                ),
                                              ));
                                        }),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.0232),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.47,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              widget.screenWidth * 0.041,
                                          vertical:
                                              widget.screenHeight * 0.025),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              children: [
                                                LicevoiShetWidget(
                                                  onTap: _copy(state.model.ls
                                                      .toString()),
                                                  licevoiShet: state.model.ls,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          widget.screenWidth *
                                                              0.05),
                                                  child: ShowBalanceWidget(
                                                    isPositive: double.parse(
                                                                state.model
                                                                    .balance) >=
                                                            0
                                                        ? true
                                                        : false,
                                                    balance:
                                                        state.model.balance,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15),
                                              child: HistoryOperationButton(),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      widget.screenWidth *
                                                          0.013),
                                              child: Row(
                                                children: [
                                                  CustomContainer(
                                                    image: Images
                                                        .doveritelnyiplateg,
                                                    description:
                                                        "Доверительный платежДоверитеfewef",
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
                                                    onTap: () {},
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: widget.screenHeight *
                                                      0.015),
                                              child: const PayButton(),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: widget.screenHeight * 0.038,
                                      left: 25),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Подключенные услуги:",
                                        style: AppFonts.s22w700,
                                      ),
                                      SizedBox(
                                        height: 100,
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount:
                                              state.model.services.length,
                                          itemBuilder: (context, index) =>
                                              ActiveServices(
                                            imageOfService: Images.internet,
                                            serviceName: state.model.services[0]
                                                [0],
                                            isPaid: true,
                                          ),
                                        ),
                                      ),
                                      // ActiveServices(
                                      //   imageOfService: Images.tele,
                                      //   serviceName:
                                      //       "Телевидение SuperTV (бесплатно)",
                                      //   isPaid: true,
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ),
                ]);
          } else if (state is GetPersonalDetailsLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is GetPersonalDetailsError) {
            return Text(state.errorText);
          }
          return const SizedBox();
        },
      ),
    );
  }

  _copy(String text) {
    final value = ClipboardData(text: text);
    Clipboard.setData(value);
  }
}
