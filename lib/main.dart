import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:skynet/core/network/dio_settings.dart';
import 'package:skynet/core/routes/app_router.dart';
import 'package:skynet/data/providers/profile_info_provider.dart';
import 'package:skynet/domain/repositories/get_all_news_repo_impl.dart';
import 'package:skynet/domain/repositories/get_profile_details_repo_impl.dart';
import 'package:skynet/domain/repositories/get_transactions_histor_impl.dart';
import 'package:skynet/domain/usecase/get_all_news_repo_usecase.dart';
import 'package:skynet/domain/usecase/get_profile_details_repo_usecase.dart';
import 'package:skynet/domain/usecase/get_transactions_histor_usecase.dart';
import 'package:skynet/presentation/blocs/news_bloc/new_list_bloc.dart';
import 'package:skynet/presentation/blocs/personal_details_bloc/get_personal_details_bloc.dart';
import 'package:skynet/presentation/blocs/transactions_bloc/transactions_bloc.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => GetProfileDetailsUseCase(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
          create: (context) => GetProfileDetailsRepoImpl(
              useCase:
                  RepositoryProvider.of<GetProfileDetailsUseCase>(context)),
        ),
        RepositoryProvider(
            create: (context) => GetAllNewsRepositoryUseCase(
                dio: RepositoryProvider.of<DioSettings>(context).dio)),
        RepositoryProvider(
            create: (context) => GetAllNewsRepositoryImpl(
                useCase: RepositoryProvider.of<GetAllNewsRepositoryUseCase>(
                    context))),
        RepositoryProvider(
            create: (context) => GetTransactionsHistoryUseCase(
                dio: RepositoryProvider.of<DioSettings>(context).dio)),
        RepositoryProvider(
            create: (context) => GetTransactionsHistoryRepoImpl(
                useCase: RepositoryProvider.of<GetTransactionsHistoryUseCase>(
                    context)))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetPersonalDetailsBloc(
                repository:
                    RepositoryProvider.of<GetProfileDetailsRepoImpl>(context)),
          ),
          BlocProvider(
            create: (context) => NewListBloc(
                repository:
                    RepositoryProvider.of<GetAllNewsRepositoryImpl>(context)),
          ),
          BlocProvider(
              create: (context) => TransactionsBloc(
                  repository:
                      RepositoryProvider.of<GetTransactionsHistoryRepoImpl>(
                          context)))
        ],
        child: ChangeNotifierProvider(
          create: (context) => GetProfileInfoProvider(),
          child: MaterialApp.router(
            routerConfig: AppRouter().config(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(scaffoldBackgroundColor: const Color(0xffFCE6F1)),
          ),
        ),
      ),
    );
  }
}
