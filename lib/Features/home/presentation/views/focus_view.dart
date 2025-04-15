import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:toda_app/Features/home/presentation/widgets/focus_stats_section.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/themes/text_styles.dart';


class FocusView extends StatefulWidget {
  const FocusView({super.key});

  @override
  State<FocusView> createState() => _FocusViewState();
}

class _FocusViewState extends State<FocusView> {
  int totalSeconds = 30 * 60; 
  int remainingSeconds = 30 * 60;
  Timer? _timer;
  bool isRunning = false;

  void toggleTimer() {
    if (isRunning) {
      _timer?.cancel(); 
    } else {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (remainingSeconds > 0) {
          setState(() {
            remainingSeconds--;
          });
        } else {
          timer.cancel();
          setState(() {
            isRunning = false;
          });
        }
      });
    }

    setState(() {
      isRunning = !isRunning;
    });
  }

  String formatTime(int seconds) {
    final min = (seconds ~/ 60).toString().padLeft(2, '0');
    final sec = (seconds % 60).toString().padLeft(2, '0');
    return '$min:$sec';
  }

  @override
  Widget build(BuildContext context) {
    double percent = 1 - (remainingSeconds / totalSeconds);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Text(
                  'Focus Mode',
                  style: Styles.textStyle24,
                ),
                SizedBox(height: 30.h),
                CircularPercentIndicator(
                  radius: 110.0.r,
                  lineWidth: 10.0.r,
                  percent: percent,
                  center: Text(
                    formatTime(remainingSeconds),
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                  progressColor: ColorsManger.kPrimaryColor,
                  backgroundColor: Colors.grey.shade800,
                  circularStrokeCap: CircularStrokeCap.round,
                ),
                SizedBox(height: 20.h),
                Text(
                  'While your focus mode is on, all of your notifications will be off',
                  style: Styles.textStyle16.copyWith(color: Colors.grey,),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.h),
                ElevatedButton(
                  onPressed: toggleTimer,
                  style: ElevatedButton.styleFrom(
                    
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor:
                        isRunning ? Colors.red : ColorsManger.kPrimaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 15.h),
                  ),
                  child: Text(
                    isRunning ? 'Pause' : 'Start',
                    style: Styles.textStyle16,
                  ),
                ),
                FocusStatsSection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}