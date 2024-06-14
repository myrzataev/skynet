import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/transactions_bloc/transactions_bloc.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/custom_app_bar_two.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/custom_error_widget.dart';

@RoutePage()
class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<TransactionsBloc>(context)
        .add(GetTransactionsHistoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: const CustomAppBarWithoutProfileDetails(
            appBarTitle: "История поступлений"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            BlocBuilder<TransactionsBloc, TransactionsState>(
                builder: (context, state) {
              if (state is TransactionsSuccess) {
                return SizedBox(
                  height: 677.h,
                  width: double.infinity,
                  child: ListView.builder(
                    padding: EdgeInsetsDirectional.zero,
                    itemBuilder: (context, index) {
                      String dateString =
                          state.model.transactions[index][1].toString();
                      DateTime dateTime = DateTime.parse(dateString);
                      final formattedDate = DateFormat(
                        'd MMMM',"ru_RU"
                      ).format(dateTime);

                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 25.w),
                              child: Text(
                                formattedDate,
                                style: AppFonts.s12w500,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 64.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 0.1.r,
                                    blurRadius: 7.r,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 25.w),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 40.h,
                                      width: 270.w,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            state.model.transactions[index][2],
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            maxLines: 1,
                                            style: AppFonts.s14w500,
                                          ),
                                          Text(
                                            DateFormat("HH:MM")
                                                .format(dateTime)
                                                .toString(),
                                            style: AppFonts.s10w500.copyWith(
                                                color: const Color(0xff808080)),
                                          )
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: EdgeInsets.only(right: 25.w),
                                      child: Text(
                                        "+ ${state.model.transactions[index].first}",
                                        style: AppFonts.s14w500.copyWith(
                                            color: int.parse(state
                                                        .model
                                                        .transactions
                                                        .first
                                                        .first
                                                        .toString()) >=
                                                    0
                                                ? Colors.green
                                                : Colors.red),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: state.model.transactions.length,
                  ),
                );
              } else if (state is TransactionsLoading) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              } else if (state is TransactionsError) {
                return Center(
                  child: CustomErrorWidget(onTap: () async {
                    setState(() {
                      BlocProvider.of<TransactionsBloc>(context)
                          .add(GetTransactionsHistoryEvent());
                    });
                  }),
                );
              }

              return const SizedBox();
            })
          ]),
        ],
      ),
    );
  }
}
