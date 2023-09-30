import 'package:bmi_calculator/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      backgroundColor: colorSplashBG,
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: REdgeInsets.symmetric(horizontal: 24),
            children: [
              Image.asset(
                "assets/images/appLogo.png",
                height: 200.h,
                width: 300.w,
              ),
              SizedBox(height: 100.h),
              Text(
                "Calculate my BMI",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: colorWhite,
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                "Discover your BMI with our app!. Enter your gender, height, weight and age to get valuable insights into your health. Let's start your wellness journey today! ",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: colorWhite,
                ),
              ),
              InkWell(
                onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen())),
                child: Container(
                  height: 50.h,
                  width: 200.w,
                  margin: REdgeInsets.symmetric(vertical: 48),
                  decoration: BoxDecoration(
                    color: colorWhite,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Start",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: colorSplashBG,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      const Icon(
                        Icons.arrow_forward,
                        color: colorSplashBG,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
