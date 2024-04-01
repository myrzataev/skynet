import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/trust_payment_bloc/get_trust_payment_bloc.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/custom_activation_button.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/trust_payment_widget.dart';
import 'package:skynet/resources/resources.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

@RoutePage()
class TrustPaymentPage extends StatelessWidget {
  const TrustPaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Images.calendar,
            fit: BoxFit.fill,
            height: 350.h,
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
                iconSize: 30,
              )),
          DraggableScrollableSheet(
            initialChildSize: 400.h / 640.h,
            minChildSize: 379.h / 640.h,
            maxChildSize: 1,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Color(0xffFCE6F1),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 25),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Доверительный платеж",
                                        style: AppFonts.s22w700,
                                      ),
                                      const TrustPaymentWidget(
                                        logo: Images.calendarlogo,
                                        text:
                                            "Услуга доступна с 1-е по 5-е число месяца",
                                      ),
                                      const TrustPaymentWidget(
                                        logo: Images.pricelogo,
                                        text:
                                            "Данная услуга абсолютно бесплатна!",
                                      ),
                                      const TrustPaymentWidget(
                                        logo: Images.lightinglogo,
                                        text:
                                            "Активировать возможно только, если Вы оплачивали в прошлом месяце",
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
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: GestureDetector(
          onTap: () {
            BlocProvider.of<GetTrustPaymentBloc>(context).add(GetCreditEvent());
          },
          child: CustomActivationButton(
            childWidget: BlocBuilder<GetTrustPaymentBloc, GetTrustPaymentState>(
              builder: (context, state) {
                if (state is GetTrustPaymentLoading) {
                  return LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.pinkAccent,
                    size: 30,
                  );
                } else if (state is GetTrustPaymentSuccess) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Активирован",
                          style: AppFonts.s12w500.copyWith(color: Colors.green),
                        ),
                      ],
                    ),
                  );
                } else if (state is GetTrustPaymentError) {
                  return Text(
                    "Не удалось активировать",
                    style: AppFonts.s12w500.copyWith(color: Colors.red),
                  );
                }
                return Text(
                  "Активировать",
                  style: AppFonts.s14w500,
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
