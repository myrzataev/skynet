import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/features/main/features/home/presentation/blocs/pay_cubit/pay_cubit.dart';

class CustomPayFromServices extends StatelessWidget {
  final String image;
  final String name;
  final String url;

  const CustomPayFromServices({
    super.key,
    required this.image,
    required this.name,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<PayCubit>(context).payFromService(url: url);
        },
        child: Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.2,
                  blurRadius: 7,
                  offset: const Offset(0, 0.5), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  height: 60.h,
                ),
                Text(
                  name,
                  style: AppFonts.s10w500,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            )),
      ),
    );
  }
}
