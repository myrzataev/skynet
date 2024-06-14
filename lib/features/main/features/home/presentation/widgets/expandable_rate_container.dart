import 'package:flutter/material.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/rate_service_engineer_big.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/rate_service_engineer_small.dart';

class ExpandableRateContainer extends StatefulWidget {
  final String phoneNumber;
  final String executorNameSurname;
  final String photo;
  final String id;
  const ExpandableRateContainer({super.key, required this.phoneNumber, required this.executorNameSurname, required this.photo, required this.id});

  @override
  State<ExpandableRateContainer> createState() =>
      _ExpandableRateContainerState();
}

class _ExpandableRateContainerState extends State<ExpandableRateContainer> {
  bool isExpanded = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return InkWell(
        onTap: () {
          setState(() {
            isExpanded = true;
          });
        },
        child: AnimatedCrossFade(
            firstChild: RateServiceEngineerSmallWidget(
              photo: widget.photo,
              nameSurName: widget.executorNameSurname,
              phoneNumber: widget.phoneNumber,
            ),
            secondChild: RateServiceEngineerExpandedWidget(
              id: widget.id,
              photo: widget.photo,
              nameSurName: widget.executorNameSurname,
         
              phoneNumber: widget.phoneNumber,
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(microseconds: 200)),
      );
    });
  }
}
