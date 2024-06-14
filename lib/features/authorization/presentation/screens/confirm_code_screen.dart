import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:skynet/core/consts/app_consts.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/features/authorization/presentation/blocs/confirm_code_bloc/confirm_code_bloc.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/pay_cubit/pay_cubit.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/custom_activation_button.dart';
import 'package:skynet/resources/resources.dart';
import 'package:uiblock/uiblock.dart';

@RoutePage()
class ConfirmCodeScreen extends StatefulWidget {
  final String phoneNumber;

  const ConfirmCodeScreen({super.key, required this.phoneNumber});

  @override
  State<ConfirmCodeScreen> createState() => _PinputExampleState();
}

class _PinputExampleState extends State<ConfirmCodeScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool hasError = false;
  bool smcCodeCorrect = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    smcCodeCorrect = true;
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const defaultBorderColor = Colors.white;
    const fillColor = Colors.white;
    const focusedBorderColor = Colors.grey;
    const errorBorderColor = Colors.red;
    final defaultPinTheme = PinTheme(
      width: 70.w,
      height: 70.h,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        color: Colors.white,
        border: Border.all(
            color: hasError ? errorBorderColor : defaultBorderColor,
            width: 3.w),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return Scaffold(
      backgroundColor: const Color(0xffFCE6F1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.h),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: ImageIcon(
                        const AssetImage(
                          Images.closeicon,
                        ),
                        size: 25.h,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Spacer(),
                    IconButton(
                      icon: ImageIcon(
                        const AssetImage(Images.callcenter),
                        size: 25.h,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        BlocProvider.of<PayCubit>(context)
                            .payFromService(url: AppConsts.openWatsapp);
                      },
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 23.h),
                  child: Image.asset(
                    Images.catlogo,
                    height: 248.h,
                    width: 223.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
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
                Padding(
                  padding: EdgeInsets.only(left: 15.w, bottom: 8.h, top: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Код из СМС для ",
                        style: AppFonts.s12w500,
                      ),
                      Text(
                        "+996${widget.phoneNumber}",
                        style: AppFonts.s12w500,
                      )
                    ],
                  ),
                ),
                Center(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Directionality(
                          // Specify direction if desired
                          textDirection: TextDirection.ltr,
                          child: Pinput(
                            controller: pinController,
                            focusNode: focusNode,
                            androidSmsAutofillMethod:
                                AndroidSmsAutofillMethod.smsUserConsentApi,
                            listenForMultipleSmsOnAndroid: true,
                            defaultPinTheme: defaultPinTheme,
                            separatorBuilder: (index) => SizedBox(width: 8.w),
                            // validator: (value) {},
                            hapticFeedbackType: HapticFeedbackType.lightImpact,
                            onCompleted: (pin) {},
                            onChanged: (value) {},
                            cursor: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 9.h),
                                  width: 22.w,
                                  height: 1.h,
                                  color: focusedBorderColor,
                                ),
                              ],
                            ),
                            focusedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                borderRadius: BorderRadius.circular(15.r),
                                border: Border.all(
                                  color: focusedBorderColor,
                                  width: 3.w,
                                ),
                              ),
                            ),
                            submittedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                color: fillColor,
                                borderRadius: BorderRadius.circular(19),
                                // border: Border.all(color: focusedBorderColor),
                              ),
                            ),
                            errorPinTheme: defaultPinTheme.copyBorderWith(
                              border: Border.all(color: Colors.redAccent),
                            ),
                          ),
                        ),
                        smcCodeCorrect
                            ? const Text("")
                            : Text(
                                "Неправильный код",
                                style: AppFonts.s14w700
                                    .copyWith(color: Colors.red),
                              ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 30.w,
                          ),
                          child: SizedBox(
                            height: 50.h,
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: InkWell(
                                  onTap: () {
                                    BlocProvider.of<ConfirmCodeBloc>(context)
                                        .add(ConfirmsmsCodeEvent(
                                            smsCode: pinController.text));
                                    focusNode.unfocus();
                                    formKey.currentState!.validate();
                                  },
                                  child: Ink(
                                      child: CustomActivationButton(
                                          height: 54.h,
                                          childWidget: BlocListener<
                                              ConfirmCodeBloc,
                                              ConfirmCodeState>(
                                            listener: (context, state) {
                                              if (state
                                                  is ConfirmCodeSucccess) {
                                                UIBlock.unblock(context);

                                                context.go(
                                                    '/confirmCode/${widget.phoneNumber}/agreement');
                                              } else if (state
                                                  is ConfirmCodeError) {
                                                UIBlock.unblock(context);
                                                if (state.errorText ==
                                                    "Неправильный код") {
                                                  setState(() {
                                                    smcCodeCorrect = false;
                                                    hasError = true;
                                                  });
                                                }
                                              } else if (state
                                                  is ConfirmCodeLoading) {
                                                UIBlock.block(
                                                  context,
                                                  canDissmissOnBack: true,
                                                );
                                              }
                                            },
                                            child: Text(
                                              "Войти",
                                              style: AppFonts.s14w500,
                                            ),
                                          )))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
