import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:skynet/features/authorization/presentation/screens/connectivity_widget.dart';
import 'package:skynet/features/main/features/home/presentation/providers/check_internet_connection.dart';

class TestPageForinternet extends StatelessWidget {
  const TestPageForinternet({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return ConnectivityOverlay(
      isConnected: context.watch<CheckInternetConnectionProvider>().isConnected,
      child: const Scaffold(
        body: Column(
      
        ),
      ),
    );
  }
}
