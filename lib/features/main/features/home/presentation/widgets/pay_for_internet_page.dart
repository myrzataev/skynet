import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/custom_app_bar_two.dart';
import 'package:skynet/resources/resources.dart';

@RoutePage()
class PayForInternetPage extends StatelessWidget {
  const PayForInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBarWithoutProfileDetails(
              appBarTitle: "Оплатить за интернет"),
          Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: SizedBox(
              height: 643.h,
              width: 390.w,
              child: GridView.builder(
                padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 100,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 0),
                  itemCount: AvailablePaymentModelData.gridviewItems.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Image.asset(
                        AvailablePaymentModelData.gridviewItems[index].photo,
                        // height: 100,
                        // width: 100,
                      ),
                    );
                  }),
            ),
          ),
        ],
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
