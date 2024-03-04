import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/modules/home/presentation/blocs/transactions_bloc/transactions_bloc.dart';

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
        title: Text(
          "История транзакций",
          style: AppFonts.s20w500.copyWith(color: Colors.black),
        ),
        backgroundColor: const Color(0xffFCE6F1),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          BlocBuilder<TransactionsBloc, TransactionsState>(
              builder: (context, state) {
            if (state is TransactionsSuccess) {
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    String dateString =
                        state.model.transactions[index][1].toString();
                    DateTime dateTime = DateTime.parse(dateString);
                    String formattedDate =
                        DateFormat('yyyy-MM-dd HH:mm').format(dateTime);

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(formattedDate),
                          Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child:
                                    Text(state.model.transactions[index][2])),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: state.model.transactions.length,
                ),
              );
            } else if (state is TransactionsLoading) {
              return Center(child: const CircularProgressIndicator.adaptive());
            } else if (state is TransactionsError) {
              return Center(
                child: Text(state.errorText),
              );
            }

            return const SizedBox();
          })
        ]),
      ),
    );
  }
}
