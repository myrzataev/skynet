import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:skynet/core/network/dio_settings.dart';
import 'package:skynet/config/routes/app_router.dart';
import 'package:skynet/core/services/shared_preferences_provider.dart';
import 'package:skynet/core/unfocus_settings.dart';
import 'package:skynet/features/authorization/data/repositories/authorization_get_sms_impl.dart';
import 'package:skynet/features/authorization/data/data_sources/authorization_get_sms_usecase.dart';
import 'package:skynet/features/authorization/data/data_sources/confirm_code_repository.dart';
import 'package:skynet/features/authorization/presentation/blocs/authorization_bloc/authorization_bloc.dart';
import 'package:skynet/features/authorization/presentation/blocs/confirm_code_bloc/confirm_code_bloc.dart';
import 'package:skynet/features/authorization/presentation/blocs/internet_cubit/internet_cubit.dart';
import 'package:skynet/features/main/features/home/data/data_sources/get_notifications_list_ds.dart';
import 'package:skynet/features/main/features/home/data/data_sources/mark_notification_as_viewed_ds.dart';
import 'package:skynet/features/main/features/home/data/data_sources/sen_feedback_ds.dart';
import 'package:skynet/features/main/features/home/data/repositories/get_notifications_list_impl.dart';
import 'package:skynet/features/main/features/home/data/repositories/mark_notification_as_viewed_impl.dart';
import 'package:skynet/features/main/features/home/data/repositories/send_feedback_impl.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/get_notifications_list_bloc/get_notifications_list_bloc.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/mark_notification_as_viewed_bloc/mark_notification_as_viewed_bloc.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/send_feedback/send_feed_back_bloc.dart';
import 'package:skynet/features/main/features/home/presentation/providers/check_internet_connection.dart';
import 'package:skynet/features/main/features/home/presentation/providers/profile_info_provider.dart';
import 'package:skynet/features/main/features/home/presentation/providers/sms_code_provider.dart';
import 'package:skynet/features/main/features/home/data/repositories/application_status_repo_impl.dart';
import 'package:skynet/features/main/features/home/data/repositories/get_profile_details_repo_impl.dart';
import 'package:skynet/features/main/features/home/data/repositories/get_stories_repo_impl.dart';
import 'package:skynet/features/main/features/home/data/repositories/get_transactions_histor_impl.dart';
import 'package:skynet/features/main/features/home/data/repositories/get_trust_payment_impl.dart';
import 'package:skynet/features/main/features/home/data/data_sources/application_status_use_case.dart';
import 'package:skynet/features/main/features/home/data/data_sources/get_profile_details_repo_usecase.dart';
import 'package:skynet/features/main/features/home/data/data_sources/get_stories_usecase.dart';
import 'package:skynet/features/main/features/home/data/data_sources/get_transactions_histor_usecase.dart';
import 'package:skynet/features/main/features/home/data/data_sources/get_trust_payment_usecase.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/application_status_bloc/application_status_bloc.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/image_precashe_cubit/imageprecashe_cubit.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/pay_cubit/pay_cubit.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/personal_details_bloc/get_personal_details_bloc.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/stories_bloc/stories_bloc.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/transactions_bloc/transactions_bloc.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/trust_payment_bloc/get_trust_payment_bloc.dart';
import 'package:skynet/features/main/features/home/presentation/providers/viewed_news_list.dart';
import 'package:skynet/features/main/features/news/data/repositories/get_all_news_repo_impl.dart';
import 'package:skynet/features/main/features/news/data/repositories/get_local_news_impl.dart';
import 'package:skynet/features/main/features/news/data/repositories/get_personal_news_impl.dart';
import 'package:skynet/features/main/features/news/data/repositories/mark_as_read_impl.dart';
import 'package:skynet/features/main/features/news/data/data_sources/get_all_news_repo_usecase.dart';
import 'package:skynet/features/main/features/news/data/data_sources/get_local_news_usecase.dart';
import 'package:skynet/features/main/features/news/data/data_sources/get_personal_news_use_case.dart';
import 'package:skynet/features/main/features/news/data/data_sources/mark_as_viewed_use_case.dart';
import 'package:skynet/features/main/features/news/presentation/blocs/cubit/mark_as_viewed_cubit.dart';
import 'package:skynet/features/main/features/news/presentation/blocs/local_news_bloc/localnews_bloc.dart';
import 'package:skynet/features/main/features/news/presentation/blocs/news_bloc/new_list_bloc.dart';
import 'package:skynet/features/main/features/news/presentation/blocs/personal_news/personal_news_bloc.dart';
import 'package:skynet/features/main/features/profile/data/repositories/logout_impl.dart';
import 'package:skynet/features/main/features/profile/data/data_sources/logout_use_case.dart';
import 'package:skynet/features/main/features/profile/presentation/blocs/bloc/log_out_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(create: (context) => SharedPreferencesRepository()),
        RepositoryProvider(
          create: (context) => GetProfileDetailsUseCase(
              dio: RepositoryProvider.of<DioSettings>(context).dio,
              prefs: RepositoryProvider.of<SharedPreferencesRepository>(context)
                  .prefs),
        ),
        RepositoryProvider(
          create: (context) => GetProfileDetailsRepoImpl(
              useCase:
                  RepositoryProvider.of<GetProfileDetailsUseCase>(context)),
        ),
        RepositoryProvider(
            create: (context) => GetAllNewsRepositoryUseCase(
                dio: RepositoryProvider.of<DioSettings>(context).dio,
                prefs:
                    RepositoryProvider.of<SharedPreferencesRepository>(context)
                        .prefs)),
        RepositoryProvider(
            create: (context) => GetAllNewsRepositoryImpl(
                useCase: RepositoryProvider.of<GetAllNewsRepositoryUseCase>(
                    context))),
        RepositoryProvider(
            create: (context) => GetTransactionsHistoryUseCase(
                dio: RepositoryProvider.of<DioSettings>(context).dio,
                prefs:
                    RepositoryProvider.of<SharedPreferencesRepository>(context)
                        .prefs)),
        RepositoryProvider(
            create: (context) => GetTransactionsHistoryRepoImpl(
                useCase: RepositoryProvider.of<GetTransactionsHistoryUseCase>(
                    context))),
        RepositoryProvider(
          create: (context) => AuthorizationGetSmsCodeUseCase(
              dio: RepositoryProvider.of<DioSettings>(context).dio,
              prefs: RepositoryProvider.of<SharedPreferencesRepository>(context)
                  .prefs),
        ),
        RepositoryProvider(
            create: (context) => AuthorizationGetSmsCodeRepositoryImpl(
                useCase: RepositoryProvider.of<AuthorizationGetSmsCodeUseCase>(
                    context))),
        RepositoryProvider(
            create: (context) => ConfirmCodeRepository(
                dio: RepositoryProvider.of<DioSettings>(context).dio,
                prefs:
                    RepositoryProvider.of<SharedPreferencesRepository>(context)
                        .prefs)),
        RepositoryProvider(
            create: (context) => GetStoriesUseCase(
                dio: RepositoryProvider.of<DioSettings>(context).dio,
                prefs:
                    RepositoryProvider.of<SharedPreferencesRepository>(context)
                        .prefs)),
        RepositoryProvider(
            create: (context) => GetStoriesRepositoryImpl(
                useCase: RepositoryProvider.of<GetStoriesUseCase>(context))),
        RepositoryProvider(
            create: (context) => GetTrustPaymentUseCase(
                dio: RepositoryProvider.of<DioSettings>(context).dio,
                prefs:
                    RepositoryProvider.of<SharedPreferencesRepository>(context)
                        .prefs)),
        RepositoryProvider(
            create: (context) => GetTrustPaymentRepositoryImpl(
                useCase:
                    RepositoryProvider.of<GetTrustPaymentUseCase>(context))),
        RepositoryProvider(
            create: (context) => GetPersonalNewsRepositoryUseCase(
                dio: RepositoryProvider.of<DioSettings>(context).dio,
                prefs:
                    RepositoryProvider.of<SharedPreferencesRepository>(context)
                        .prefs)),
        RepositoryProvider(
            create: (context) => GetPersonalNewsImpl(
                useCase:
                    RepositoryProvider.of<GetPersonalNewsRepositoryUseCase>(
                        context))),
        RepositoryProvider(
            create: (context) => LogOutUseCase(
                dio: RepositoryProvider.of<DioSettings>(context).dio,
                prefs:
                    RepositoryProvider.of<SharedPreferencesRepository>(context)
                        .prefs)),
        RepositoryProvider(
            create: (context) => LogOutRepositoryImpl(
                useCase: RepositoryProvider.of<LogOutUseCase>(context))),
        RepositoryProvider(
            create: (context) => GetLocalNewsUseCase(
                dio: RepositoryProvider.of<DioSettings>(context).dio,
                prefs:
                    RepositoryProvider.of<SharedPreferencesRepository>(context)
                        .prefs)),
        RepositoryProvider(
            create: (context) => GetLocalNewsRepositoryImpl(
                useCase: RepositoryProvider.of<GetLocalNewsUseCase>(context))),
        RepositoryProvider(
            create: (context) => MarkAsViewedUseCase(
                dio: RepositoryProvider.of<DioSettings>(context).dio,
                prefs:
                    RepositoryProvider.of<SharedPreferencesRepository>(context)
                        .prefs)),
        RepositoryProvider(
            create: (context) => MarkAsViewedRepositoryImpl(
                useCase: RepositoryProvider.of<MarkAsViewedUseCase>(context))),
        RepositoryProvider(
            create: (context) => ApplicationStatusUseCase(
                dio: RepositoryProvider.of<DioSettings>(context).dio,
                prefs:
                    RepositoryProvider.of<SharedPreferencesRepository>(context)
                        .prefs)),
        RepositoryProvider(
            create: (context) => ApplicationStatusRepoImpl(
                useCase:
                    RepositoryProvider.of<ApplicationStatusUseCase>(context))),
        RepositoryProvider(
            create: (context) => SendFeedBackDataSource(
                dio: RepositoryProvider.of<DioSettings>(context).dio,
                prefs:
                    RepositoryProvider.of<SharedPreferencesRepository>(context)
                        .prefs)),
        RepositoryProvider(
            create: (context) => SendFeedBackImpl(
                dataSource:
                    RepositoryProvider.of<SendFeedBackDataSource>(context))),
        RepositoryProvider(
            create: (context) => GetNotificationsListDs(
                dio: RepositoryProvider.of<DioSettings>(context).dio,
                preferences:
                    RepositoryProvider.of<SharedPreferencesRepository>(context)
                        .prefs)),
        RepositoryProvider(
            create: (context) => GetNotificationsListImpl(
                dataSource:
                    RepositoryProvider.of<GetNotificationsListDs>(context))),
        RepositoryProvider(
            create: (context) => MarkNotificationAsViewedDs(
                dio: RepositoryProvider.of<DioSettings>(context).dio,
                preferences:
                    RepositoryProvider.of<SharedPreferencesRepository>(context)
                        .prefs)),
        RepositoryProvider(
            create: (context) => MarkNotificationAsViewedImpl(
                dataSource:
                    RepositoryProvider.of<MarkNotificationAsViewedDs>(context)))
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
                          context))),
          BlocProvider(
              create: (context) => AuthorizationBloc(
                  repository: RepositoryProvider.of<
                      AuthorizationGetSmsCodeRepositoryImpl>(context))),
          BlocProvider(
              create: (context) => ConfirmCodeBloc(
                  repository:
                      RepositoryProvider.of<ConfirmCodeRepository>(context))),
          BlocProvider(
              create: (context) => StoriesBloc(
                  repositoryImpl:
                      RepositoryProvider.of<GetStoriesRepositoryImpl>(
                          context))),
          BlocProvider(create: (context) => PayCubit()),
          BlocProvider(
              create: (context) => GetTrustPaymentBloc(
                  repositoryImpl:
                      RepositoryProvider.of<GetTrustPaymentRepositoryImpl>(
                          context))),
          BlocProvider(
              create: (context) => PersonalNewsBloc(
                  repository:
                      RepositoryProvider.of<GetPersonalNewsImpl>(context))),
          BlocProvider(
              create: (context) => InternetCubit(connectivity: Connectivity())),
          BlocProvider(
              create: (context) => LogOutBloc(
                  repositoryImpl:
                      RepositoryProvider.of<LogOutRepositoryImpl>(context))),
          BlocProvider(create: (context) => ImageprecasheCubit()),
          BlocProvider(
              create: (context) => LocalnewsBloc(
                  repositoryImpl:
                      RepositoryProvider.of<GetLocalNewsRepositoryImpl>(
                          context))),
          BlocProvider(
              create: (context) => MarkAsViewedCubit(
                  repositoryImpl:
                      RepositoryProvider.of<MarkAsViewedRepositoryImpl>(
                          context))),
          BlocProvider(
              create: (context) => ApplicationStatusBloc(
                  repository: RepositoryProvider.of<ApplicationStatusRepoImpl>(
                      context))),
          BlocProvider(
              create: (context) => SendFeedBackBloc(
                  impl: RepositoryProvider.of<SendFeedBackImpl>(context))),
          BlocProvider(
              create: (context) => GetNotificationsListBloc(
                  repoImpl: RepositoryProvider.of<GetNotificationsListImpl>(
                      context))),
          BlocProvider(
              create: (context) => MarkNotificationAsViewedBloc(
                  repoImpl: RepositoryProvider.of<MarkNotificationAsViewedImpl>(
                      context)))
        ],
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (context) => GetProfileInfoProvider()),
            ChangeNotifierProvider(
                create: (context) => CheckInternetConnectionProvider()),
            ChangeNotifierProvider(create: (context) => SmsCodeProvider()),
            ChangeNotifierProvider(
                create: (context) => ViewedNewsProvider(
                    prefs: RepositoryProvider.of<SharedPreferencesRepository>(
                            context)
                        .prefs))
          ],
          child: ScreenUtilInit(
            ensureScreenSize: true,
            rebuildFactor: (previous, current) => false,
            useInheritedMediaQuery: true,
            splitScreenMode: true,
            minTextAdapt: true,
            designSize: const Size(390.0, 803.0),
            builder: (context, child) {
              return TextFieldUnfocus(
                child: MaterialApp.router(
                    routerConfig: appRoutes,
                    builder: (context, child) {
                      return MediaQuery.withNoTextScaling(child: child!);
                    },
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(scaffoldBackgroundColor: Colors.white)),
              );
            },
          ),
        ),
      ),
    );
  }
}
