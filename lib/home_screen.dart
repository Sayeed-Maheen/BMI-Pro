import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import 'app_colors.dart';

enum Gender { male, female }

class Logic {
  double calculateBMI(int heightFeet, int heightInches, int weight) {
    double heightInMeters = (heightFeet * 12 + heightInches) * 0.0254;
    return weight / (heightInMeters * heightInMeters);
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender selectedCard = Gender.male;
  int weight = 70;
  int age = 25;
  int heightFeet = 5;
  int heightInches = 6;
  double sliderValue = 66.025;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: appBar(),
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              children: [
                genderMaleSection(),
                genderFemaleSection(),
              ],
            ),
            heightSection(),
            Row(
              children: [
                weightSection(),
                ageSection(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          resultBottomSheet(context);
        },
        child: Container(
          height: 50.h,
          width: double.infinity,
          margin: REdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorButtonGradientStart,
                colorButtonGradientEnd,
              ],
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Text(
              "Calculate BMI",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      flexibleSpace: Container(
        color: colorWhite, // Set a fixed color here
      ),
      title: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 24.sp,
            color: colorBlack,
          ),
          children: const [
            TextSpan(
              text: "BMI ",
              style: TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
            TextSpan(
              text: "Pro",
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }

  Expanded genderMaleSection() {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCard = Gender.male;
          });
        },
        child: Container(
          height: 160.h,
          margin: REdgeInsets.only(top: 16, left: 16, right: 8, bottom: 16),
          decoration: BoxDecoration(
            border: Border.all(
              color: selectedCard == Gender.male
                  ? colorMaleBorder
                  : Colors.transparent,
              width: selectedCard == Gender.male ? 3.w : 0.w,
            ),
            borderRadius: BorderRadius.circular(10),
            color: colorWhite,
          ),
          child: Padding(
            padding: REdgeInsets.all(2),
            child: Lottie.asset('assets/animations/male.json', height: 150.h),
          ),
        ),
      ),
    );
  }

  Expanded genderFemaleSection() {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCard = Gender.female;
          });
        },
        child: Container(
          height: 160.h,
          margin: REdgeInsets.only(top: 16, left: 8, right: 16, bottom: 16),
          decoration: BoxDecoration(
            border: Border.all(
              color: selectedCard == Gender.female
                  ? colorFemaleBorder
                  : Colors.transparent,
              width: selectedCard == Gender.female ? 3.w : 0.w,
            ),
            borderRadius: BorderRadius.circular(10),
            color: colorWhite,
          ),
          child: Padding(
            padding: REdgeInsets.only(left: 26, bottom: 18, right: 26, top: 28),
            child: Lottie.asset(
              'assets/animations/female.json',
              height: 150.h,
            ),
          ),
        ),
      ),
    );
  }

  Card heightSection() {
    return Card(
      margin: REdgeInsets.symmetric(horizontal: 16),
      elevation: 3,
      shadowColor: colorHeightContainerShadow,
      color: colorWhite,
      child: Container(
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorGradientStart1,
              colorGradientEnd1,
            ],
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "HEIGHT",
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: colorWhite),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$heightFeet',
                  style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: colorWhite),
                ),
                Text(
                  ' ft',
                  style: TextStyle(fontSize: 18.sp, color: colorWhite),
                ),
                SizedBox(width: 10.w),
                Text(
                  '$heightInches',
                  style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: colorWhite),
                ),
                Text(
                  ' in',
                  style: TextStyle(fontSize: 18.sp, color: colorWhite),
                ),
              ],
            ),
            Slider(
              value: sliderValue,
              onChanged: (value) {
                print(sliderValue);
                setState(() {
                  sliderValue = value;
                  heightFeet = value ~/ 12;
                  heightInches = value.toInt() % 12;
                });
              },
              min: 0,
              max: 96, // Adjusted maximum value
              activeColor: colorWhite,
              inactiveColor: Colors.grey[350],
            ),
          ],
        ),
      ),
    );
  }

  Expanded ageSection() {
    return Expanded(
      child: Card(
        margin: REdgeInsets.only(top: 16, left: 8, right: 16, bottom: 16),
        elevation: 3,
        shadowColor: colorAgeContainerShadow,
        child: Container(
          padding: REdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorGradientStart3,
                colorGradientEnd3,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "AGE",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: colorWhite,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10.h),
              Text(
                '$age',
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                  color: colorWhite,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        age--;
                      });
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(
                        FontAwesomeIcons.minus,
                        color: colorContainer3,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        age++;
                      });
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(
                        FontAwesomeIcons.plus,
                        color: colorContainer3,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded weightSection() {
    return Expanded(
      flex: 1,
      child: Card(
        margin: REdgeInsets.only(top: 16, left: 16, right: 8, bottom: 16),
        elevation: 3,
        shadowColor: colorWeightContainerShadow,
        child: Container(
          padding: REdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorGradientStart2,
                colorGradientEnd2,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "WEIGHT",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: colorWhite,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10.h),
              Text(
                '$weight',
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                  color: colorWhite,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        weight--;
                      });
                    },
                    child: const CircleAvatar(
                      backgroundColor: colorBlack,
                      child: Icon(
                        FontAwesomeIcons.minus,
                        color: colorContainer2,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        weight++;
                      });
                    },
                    child: const CircleAvatar(
                      backgroundColor: colorBlack,
                      child: Icon(
                        FontAwesomeIcons.plus,
                        color: colorContainer2,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> resultBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        Logic logic = Logic();
        double bmiResult = logic.calculateBMI(heightFeet, heightInches, weight);
        String resultText = '';
        String images = '';

        if (bmiResult < 18.5) {
          resultText = 'Under weight';
          images = "assets/images/skinny.png";
        } else if (bmiResult >= 18.5 && bmiResult < 25) {
          resultText = 'Normal weight';
          images = "assets/images/healthy.png";
        } else if (bmiResult >= 25 && bmiResult < 30) {
          resultText = 'Over weight';
          images = "assets/images/fat.png";
        } else {
          resultText = 'Obese';
          images = 'assets/images/fat.png';
        }

        return FractionallySizedBox(
          heightFactor: 0.75.h,
          child: Container(
            width: double.infinity,
            padding: REdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: colorWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                Text(
                  "BMI RESULT",
                  style: TextStyle(
                    color: colorBlack,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 24.h),
                Image.asset(
                  images,
                  fit: BoxFit.cover,
                  height: 80.h,
                  width: 80.h,
                ),
                SizedBox(height: 10.h),
                Text(
                  bmiResult.toStringAsFixed(1),
                  style: TextStyle(
                    color: colorBlack,
                    fontSize: 60.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  resultText,
                  style: TextStyle(
                    color: colorBlack,
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
