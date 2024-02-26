import 'package:flutter/material.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/resources/resources.dart';

class PayForInternetPage extends StatelessWidget {
  const PayForInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: const Color(0xffFCE6F1),
        title: const Text(
          "Оплатить за интернет",
          style: AppFonts.s22w700,
        ),
      ),
      body: GridView.builder(
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
