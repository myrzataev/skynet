import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pinput/pinput.dart';
import 'package:skynet/core/consts/app_consts.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/config/routes/app_router.dart';
import 'package:skynet/features/authorization/presentation/blocs/authorization_bloc/authorization_bloc.dart';
import 'package:skynet/features/authorization/presentation/widgets/auth_textfield.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/pay_cubit/pay_cubit.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/custom_activation_button.dart';
import 'package:skynet/resources/resources.dart';
import 'package:uiblock/uiblock.dart';

@RoutePage()
class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key});

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  final TextEditingController lsController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late KeyboardVisibilityController _keyboardVisibilityController;

  late StreamSubscription<bool> keyboardSubscription;
  final FocusNode focusNode = FocusNode();
  final FocusNode focusNodeForPhone = FocusNode();
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    _keyboardVisibilityController = KeyboardVisibilityController();

    keyboardSubscription =
        _keyboardVisibilityController.onChange.listen((bool visible) {
      if (visible) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        });
      }
    });
    lsController.addListener(() {
      final text = lsController.text;
      if (text.length == 9) {
        FocusScope.of(context).unfocus();
      }
    });
    phoneNumberController.addListener(() {
      final text = phoneNumberController.text;
      if (text.length == 9) {
        FocusScope.of(context).unfocus();
      }
    });
  }

  @override
  void dispose() {
    lsController.dispose();
    phoneNumberController.dispose();
    _scrollController.dispose();
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (focusNode.hasFocus) {
          focusNode.unfocus();
        } else if (focusNodeForPhone.hasFocus) {
          focusNodeForPhone.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xffFCE6F1),
        body: SafeArea(
            child: ListView(controller: _scrollController, children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () async {
                      // final SharedPreferences prefs = await SharedPreferences.getInstance();
                      BlocProvider.of<PayCubit>(context)
                          .payFromService(url: AppConsts.openWatsapp);
                      // print('token of firebase${prefs.getString("firebase_token")}');
                    },
                    icon: ImageIcon(
                      const AssetImage(Images.callcenter),
                      color: Colors.red,
                      size: 30.h,
                    )),
                Center(
                  child: Image.asset(
                    Images.catlogo,
                    height: 248.h,
                    width: 223.w,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 34.h),
                    child: Column(
                      children: [
                        Text(
                          "Вход",
                          style: AppFonts.s32w700,
                        ),
                        Text(
                          "Личный кабинет",
                          style: AppFonts.s20w500,
                        )
                      ],
                    ),
                  ),
                ),
                CustomAuthTextField(
                  focusNode: focusNode,
                  hintText: 'Лицевой счет',
                  controller: lsController,
                  suffixIcon: Icons.key,
                ),
                CustomAuthTextField(
                  focusNode: focusNodeForPhone,
                  hintText: 'Номер телефона без 996 и 0',
                  controller: phoneNumberController,
                  suffixIcon: Icons.phone,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.h),
                  child: SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: GestureDetector(
                        onTap: () {
                          (lsController.length == 9 &&
                                  phoneNumberController.length == 9)
                              ? BlocProvider.of<AuthorizationBloc>(context).add(
                                  AuthorizationGetSmsEvent(
                                      lsAbonent: lsController.text,
                                      phoneNumber: phoneNumberController.text))
                              : null;
                        },
                        child: CustomActivationButton(
                            childWidget: BlocConsumer<AuthorizationBloc,
                                AuthorizationState>(
                          listener: (context, state) {
                            if (state is AuthorizationSuccess) {
                              UIBlock.unblock(context);
                              appRoutes.push(
                                  '/confirmCode/${phoneNumberController.text}');
                            } else if (state is AuthorizationLoading) {
                              UIBlock.block(
                                context,
                                canDissmissOnBack: true,
                              );
                            } else if (state is AuthorizationError) {
                              UIBlock.unblock(context);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Text(
                                state.errorText,
                                style: AppFonts.s14w700
                                    .copyWith(color: Colors.red),
                              )));
                            }
                          },
                          builder: (context, state) {
                            if (state is AuthorizationLoading) {
                              return LoadingAnimationWidget.staggeredDotsWave(
                                color: Colors.pinkAccent,
                                size: 30,
                              );
                            } else if (state is AuthorizationSuccess) {
                              return Text(
                                "Войти",
                                style: AppFonts.s14w500,
                              );
                            } else if (state is AuthorizationError) {
                              return Text("Войти");
                              // return Text(state.errorText);
                            }
                            return Text(
                              "Войти",
                              style: AppFonts.s14w500,
                            );
                          },
                        ))),
                  ),

                  // SizedBox(height: 50, width: 300, child: TextFormField())
                )
              ],
            ),
          ),
        ])),
      ),
    );
  }
}
