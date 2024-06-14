import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:skynet/config/app_info.dart';
import 'package:skynet/core/notification/push_notification.dart';
import 'package:skynet/config/routes/app_router.dart';
import 'package:skynet/core/services/service_locator.dart';
import 'package:skynet/firebase_options.dart';
import 'package:skynet/internal/my_app.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future _firebaseBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();
  if (message.notification != null) {
    // print("some notification received");
  }
}

void main(List<String> args) async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('ru_RU', null);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await ScreenUtil.ensureScreenSize();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      // ignore: body_might_complete_normally_catch_error
      .catchError((e) {
    // print(" Error : ${e.toString()}");
  });
  PushNotifications.init();
  PushNotifications.localNotiInit();
  await GlobalConfig.initialize();

  //listen to background notifications

  FirebaseMessaging.onBackgroundMessage(
      (message) => _firebaseBackgroundMessage(message));
//on background messages
  FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
    if (remoteMessage.notification != null) {
      appRoutes.go(
          '/bottomNavigation/readNewsFromNotification/${remoteMessage.notification?.title ?? ""}/${remoteMessage.notification?.body ?? ""}');
    }
  });
// on foregroundmessages
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    final String payloadStringData = jsonEncode(message.data);
    if (message.notification != null) {
      PushNotifications.showSimpleNotification(
          title: message.notification!.title ?? "",
          body: message.notification!.body ?? "",
          payload: payloadStringData);
    }
  });
  await setupServiceLocator();

  runApp(const MyApp());
}
