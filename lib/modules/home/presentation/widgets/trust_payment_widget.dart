import 'package:flutter/material.dart';

class TrustPaymentWidget extends StatelessWidget {
  final String logo;

  final String text;
  const TrustPaymentWidget({
    super.key,
    required this.logo,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            logo,
            height: 44,
            width: 44,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.65,
              height: 70,
              child: Text(
                text,
                softWrap: true,
                overflow: TextOverflow.clip,
                maxLines: 4,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
