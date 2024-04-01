import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skynet/resources/resources.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isAuthorized = false;
  late SharedPreferences prefs;
  @override
  void initState() {
    FlutterNativeSplash.remove();

    super.initState();
    performAsyncFunction().then((value) => setState(() {
          isAuthorized = value;
        }));
  }

  Future<bool> performAsyncFunction() async {
    bool isAuthorizelocal = false;
    prefs = await SharedPreferences.getInstance();
    if ((prefs.getString("sms") != null) &&
        (prefs.getBool("agreedToAllTerms") != false)) {
      isAuthorizelocal = true;
    } else {
      isAuthorizelocal = false;
    }
    return isAuthorizelocal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            child: FlutterSplashScreen(
          splashScreenBody: Center(
            child: SizedBox(
              height: 200.h,
              width: 200.w,
              child: Image.asset(Images.splashscreen),
            ),
          ),
          backgroundColor: const Color(0xffFCE6F1),
          onInit: () {
            debugPrint("On Init");
          },
          onEnd: () {
            debugPrint("On End");
            debugPrint("isAuthorized $isAuthorized");
            isAuthorized
                ? context.pushReplacement("/bottomNavigation")
                : context.pushReplacement("/authorization");
          },
        ))
      ] // nextScreen: aut
          ),
    );
  }
}
