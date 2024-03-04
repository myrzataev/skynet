import 'package:flutter/material.dart';
import 'package:skynet/modules/home/presentation/screens/transactions_page.dart';
import 'package:skynet/resources/resources.dart';

class HistoryOperationButton extends StatelessWidget {
  const HistoryOperationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TransactionsPage()));
      },
      child: Container(
        height: 44,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0.1,
                blurRadius: 7,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Row(
            children: [
              Image.asset(
                Images.storyofoperation,
                height: 18,
                width: 23,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text("История операций по счету",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
