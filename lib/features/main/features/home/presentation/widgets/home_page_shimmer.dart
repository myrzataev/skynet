import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/custom_stories_shimmer.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/shimmer_container.dart';

@RoutePage()
class HomePageShimmerPage extends StatelessWidget {
  const HomePageShimmerPage({super.key});

  @override
  Widget build(BuildContext context) {
    // FlutterNativeSplash.remove();
    return Container(
      decoration: const BoxDecoration(color: Color(0xffE5E5E5)),
      child: Column(children: [
        Container(
            height: 120.h,
            width: double.infinity,
            // width: 390.w,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.r),
                    bottomRight: Radius.circular(12.r))),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40.h, left: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomShimmerContainer(
                        height: 29.h,
                        width: 200.w,
                        radius: 20,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomShimmerContainer(
                        height: 30.h,
                        width: 240.w,
                        radius: 10.r,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 25.w, top: 35.h),
                  child: CustomShimmerContainer(
                      height: 30.h, width: 30.w, radius: 30.r),
                )
              ],
            )),
        Expanded(
          child: ListView(
            padding: EdgeInsetsDirectional.zero,
            scrollDirection: Axis.vertical,
            children: [
              Column(children: [
                Padding(
                  padding:  EdgeInsets.only(left: 10.w),
                  child:  const CustomStoriesShimmer(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Container(
                    height: 365.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 14.h),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 10.h),
                                        child: CustomShimmerContainer(
                                            height: 22.h,
                                            width: 150.w,
                                            radius: 10.r),
                                      ),
                                      CustomShimmerContainer(
                                          height: 32.h,
                                          width: 170.w,
                                          radius: 10.r),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 10.h),
                                        child: CustomShimmerContainer(
                                            height: 22.h,
                                            width: 130.w,
                                            radius: 10.r),
                                      ),
                                      CustomShimmerContainer(
                                          height: 32.h,
                                          width: 140.w,
                                          radius: 10.r),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.h),
                              child: CustomShimmerContainer(
                                  height: 44.h, width: 352.w, radius: 10.r),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                              ),
                              child: Row(
                                children: [
                                  CustomShimmerContainer(
                                      height: 115.h,
                                      width: 143.w,
                                      radius: 10.r),
                                  const Spacer(),
                                  CustomShimmerContainer(
                                      height: 115.h,
                                      width: 143.w,
                                      radius: 10.r),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 10.h),
                                child: CustomShimmerContainer(
                                    height: 58.5.h,
                                    width: 310.w,
                                    radius: 15.r)),
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: CustomShimmerContainer(
                      height: 26.h, width: 340, radius: 10.r),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
                  child: CustomShimmerContainer(
                      height: 73.h, width: double.infinity, radius: 25.r),
                )
              ]),
            ],
          ),
        ),
      ]),
    );
  }
}
