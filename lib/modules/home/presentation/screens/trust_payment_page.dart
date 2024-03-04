import 'package:flutter/material.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/modules/home/presentation/widgets/trust_payment_widget.dart';
import 'package:skynet/resources/resources.dart';

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
            height: MediaQuery.of(context).size.height * 0.44,
            width: double.infinity,
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.05,
              left: 25,
              child: IconButton(
                onPressed: () {Navigator.pop(context);},
                icon: Icon(Icons.close),
                iconSize: 30,
              )),
          DraggableScrollableSheet(
            initialChildSize: 379 / 640,
            minChildSize: 379 / 640,
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
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 25),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Доверительный платеж",
                                        style: AppFonts.s22w700,
                                      ),
                                      TrustPaymentWidget(
                                        logo: Images.calendarlogo,
                                        text:
                                            "Услуга доступна с 1-е по 5-е число месяца",
                                      ),
                                      TrustPaymentWidget(
                                        logo: Images.pricelogo,
                                        text:
                                            "Данная услуга абсолютно бесплатна!",
                                      ),
                                      TrustPaymentWidget(
                                        logo: Images.lightinglogo,
                                        text:
                                            "Активировать возможно только если Вы оплачивали в прошлом месяце",
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
    );
  }
}
