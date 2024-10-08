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
    print("Background notification received: ${message.notification?.title}, ${message.notification?.body}");
  }
}

void handleNotification(RemoteMessage message) {
  final String payloadStringData = jsonEncode(message.data);
  if (message.notification != null) {
    final title = message.notification!.title ?? "";
    final body = message.notification!.body ?? "";

    print("Foreground notification received: $title, $body, $payloadStringData");

    PushNotifications.showSimpleNotification(
        title: title, body: body, payload: payloadStringData);
  } else {
    print("Foreground notification received with no title or body: ${message.data}");
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
      .catchError((e) {
    print("Firebase initialization error: ${e.toString()}");
  });
  PushNotifications.init();
  PushNotifications.localNotiInit();
  await GlobalConfig.initialize();

  // Listen to background notifications
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);
  
  // On background messages
  FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
    if (remoteMessage.notification != null) {
      final title = remoteMessage.notification!.title ?? "";
      final body = remoteMessage.notification!.body ?? "";
      print("Notification opened from background: $title, $body, ${remoteMessage.data}");
      appRoutes.go(
          '/bottomNavigation/readNewsFromNotification/$title/$body');
    } else {
      print("Notification opened from background with no title or body: ${remoteMessage.data}");
    }
  });
  
  // On foreground messages
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    handleNotification(message);
  });
  
  await setupServiceLocator();

  runApp(const MyApp());
}
