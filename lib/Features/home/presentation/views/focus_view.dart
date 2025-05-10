import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:toda_app/Features/home/presentation/widgets/focus_stats_section.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/generated/l10n.dart';

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
  static const platform = MethodChannel('focus_mode');

  Future<void> enableDND() async {
    try {
      await platform.invokeMethod('enableDND');
    } catch (e) {
      print("Failed to enable DND: \$e");
    }
  }

  void toggleTimer() {
    if (isRunning) {
      _timer?.cancel();
    } else {
      enableDND();
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
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 25.0, left: 25, top: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Text(
                  S.of(context).FocusMode,
                  style: Styles.textStyle24.copyWith(
                    color: textTheme.bodyLarge!.color,
                  ),
                ),
                SizedBox(height: 30.h),
                CircularPercentIndicator(
                  radius: 110.0.r,
                  lineWidth: 10.0.r,
                  percent: percent,
                  center: Text(
                    formatTime(remainingSeconds),
                    style:
                        TextStyle(color: colorScheme.secondary, fontSize: 32),
                  ),
                  progressColor: ColorsManger.kPrimaryColor,
                  backgroundColor: Colors.grey.shade800,
                  circularStrokeCap: CircularStrokeCap.round,
                ),
                SizedBox(height: 20.h),
                Text(
                  S
                      .of(context)
                      .Whileyourfocusmodeisonallofyournotificationswillbeoff,
                  style: Styles.textStyle16.copyWith(
                    color: textTheme.bodyLarge!.color!.withOpacity(0.6),
                  ),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.w, vertical: 15.h),
                  ),
                  child: Text(
                    isRunning ? S.of(context).Pause : S.of(context).Start,
                    style: Styles.textStyle16.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
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