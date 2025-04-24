import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/generated/l10n.dart';

class FocusChart extends StatelessWidget {
  const FocusChart({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).Overview,
              style: Styles.textStyle16.copyWith(
                  color: colorScheme.secondary, fontWeight: FontWeight.w600),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    S.of(context).ThisWeek,
                    style: TextStyle(color: Colors.white70),
                  ),
                  Icon(Icons.keyboard_arrow_down, color: Colors.white70),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 30.h),
        SizedBox(
          height: 200.h,
          child: BarChart(
            BarChartData(
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        value.toInt().toString() + 'h',
                        style: Styles.textStyle14.copyWith(
                          color: colorScheme.secondary.withValues(alpha: 0.5),
                        ),
                      );
                    },
                    interval: 1,
                    reservedSize: 30.sp,
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      final days = [
                        S.of(context).SUN,
                        S.of(context).MON,
                        S.of(context).TUE,
                        S.of(context).WED,
                        S.of(context).THU,
                        S.of(context).FRI,
                        S.of(context).SAT
                      ];
                      return Text(
                        days[value.toInt()],
                        style: TextStyle(
                          color: value.toInt() == 0 || value.toInt() == 6
                              ? Colors.red
                              : colorScheme.secondary.withValues(alpha: 0.5),
                        ),
                      );
                    },
                  ),
                ),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              barGroups: [
                makeGroupData(0, 2.5),
                makeGroupData(1, 3.5),
                makeGroupData(2, 5),
                makeGroupData(3, 3),
                makeGroupData(4, 4),
                makeGroupData(5, 4.5, isSelected: true),
                makeGroupData(6, 2),
              ],
              maxY: 6,
            ),
          ),
        ),
      ],
    );
  }

  BarChartGroupData makeGroupData(int x, double y, {bool isSelected = false}) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: isSelected ? ColorsManger.kPrimaryColor : Colors.white70,
          width: 30.w,
          borderRadius: BorderRadius.circular(4),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 6.h,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}
