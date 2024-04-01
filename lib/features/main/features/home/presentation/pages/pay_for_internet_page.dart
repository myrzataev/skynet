import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skynet/features/authorization/presentation/screens/connectivity_widget.dart';
import 'package:skynet/features/main/features/home/presentation/providers/check_internet_connection.dart';
import 'package:skynet/features/main/features/home/presentation/providers/profile_info_provider.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/custom_app_bar_two.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/custom_pay_from_services.dart';
import 'package:skynet/resources/resources.dart';

@RoutePage()
class PayForInternetPage extends StatelessWidget {
  const PayForInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    var abonentInfo = context.watch<GetProfileInfoProvider>().model;
    double? positiveBalance = double.tryParse(abonentInfo?.balance ?? "");
    String positiveBalanceString = positiveBalance!.abs().toString();
    return Scaffold(
      body: ConnectivityOverlay(
        isConnected:
            context.watch<CheckInternetConnectionProvider>().isConnected,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomAppBarWithoutProfileDetails(
                appBarTitle: "Оплатить за интернет"),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomPayFromServices(
                          url:
                              "https://app.mbank.kg/deeplink?service=85313047-1c13-4151-a770-b54b536f7366&account=${abonentInfo?.ls ?? ""}&amount=$positiveBalanceString",
                          image: Images.mbanktwo,
                          name: "Мбанк",
                        ),
                        CustomPayFromServices(
                          url:
                              "https://o.kg/l/a?t=wl_ctl&id=9&req=${abonentInfo?.ls ?? ""}&sum=$positiveBalanceString",
                          image: Images.odengitwo,
                          name: "О!Деньги",
                        ),
                        CustomPayFromServices(
                          url:
                              "https://balance.kg/pay/skynet?amount=$positiveBalanceString&requisite=${abonentInfo?.ls ?? ""}",
                          image: Images.balancetwo,
                          name: "Balance.kg",
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AvailablePaymentModel {
  final String photo;
  AvailablePaymentModel({required this.photo});
}

class AvailablePaymentModelData {
  static List<AvailablePaymentModel> gridviewItems = [
    AvailablePaymentModel(
      photo: Images.mbank,
    ),
    AvailablePaymentModel(
      photo: Images.odengi,
    ),
    AvailablePaymentModel(
      photo: Images.megaPay,
    ),
    AvailablePaymentModel(
      photo: Images.balance,
    ),
    AvailablePaymentModel(
      photo: Images.rsk,
    ),
    AvailablePaymentModel(
      photo: Images.optima,
    ),
  ];
}
