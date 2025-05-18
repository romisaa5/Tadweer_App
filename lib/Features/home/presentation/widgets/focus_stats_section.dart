import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/generated/l10n.dart';
import 'package:app_usage/app_usage.dart';

class FocusStatsSection extends StatefulWidget {
  const FocusStatsSection({super.key});

  @override
  State<FocusStatsSection> createState() => _FocusStatsSectionState();
}

class _FocusStatsSectionState extends State<FocusStatsSection> {
  List<AppUsageInfo> _appUsageList = [];

  Map<String, IconData> appIcons = {
    'Facebook': Icons.facebook,
    'Telegram': Icons.telegram,
    'Instagram': Icons.camera_alt,
    'Twitter': Icons.alternate_email,
    'Gmail': Icons.email,
    'Chrome': Icons.language,
    'WhatsApp': Icons.message,
    'YouTube': Icons.ondemand_video,
    'Settings': Icons.settings,
  };

  Map<String, Color> appColors = {
    'Facebook': Colors.blue,
    'Telegram': Colors.blueAccent,
    'Instagram': Colors.pink,
    'Twitter': Colors.lightBlue,
    'Gmail': Colors.redAccent,
    'Chrome': Colors.orange,
    'WhatsApp': Colors.green,
    'YouTube': Colors.red,
    'Settings': Colors.grey,
  };

  @override
  void initState() {
    super.initState();
    _getAppUsage();
  }

  Future<void> _getAppUsage() async {
    final now = DateTime.now();
    try {
      final usageData = await AppUsage().getAppUsage(
        DateTime(now.year, now.month, now.day, 0, 0, 0),
        DateTime(now.year, now.month, now.day, 23, 59, 59),
      );

      usageData.sort((a, b) => b.usage.inSeconds.compareTo(a.usage.inSeconds));

      setState(() {
        _appUsageList = usageData;
      });
    } catch (e) {
      debugPrint('App usage error: $e');
    }
  }

  String formatUsage(Duration usage) {
    if (usage.inMinutes < 60) {
      return '${usage.inMinutes} m';
    } else {
      return '${usage.inHours} h ${usage.inMinutes.remainder(60)} m';
    }
  }

  String formatAppName(String name) {
    return name
        .split(' ')
        .map((word) => word.isNotEmpty
            ? word[0].toUpperCase() + word.substring(1).toLowerCase()
            : '')
        .join(' ');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40.h),
        Text(
          S.of(context).Applications,
          style: Styles.textStyle16.copyWith(
            color: colorScheme.secondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10.h),
        if (_appUsageList.isEmpty)
          Center(
            child: Text(
              'No usage data found today',
              style: TextStyle(color: Colors.white60),
            ),
          )
        else
          ..._appUsageList.map((appUsage) {
            final rawName = appUsage.appName;
            final appName = formatAppName(rawName);
            final usage = formatUsage(appUsage.usage);
            final usageSeconds = appUsage.usage.inSeconds;
            final progress = usageSeconds / Duration(hours: 24).inSeconds;
            final icon = appIcons[appName] ?? Icons.apps;
            final color = appColors[appName] ?? Colors.blueGrey;
            return _buildAppTile(appName, usage, icon, color, progress);
          }),
        SizedBox(height: 30.h),
      ],
    );
  }

  Widget _buildAppTile(
      String name, String usage, IconData icon, Color color, double progress) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      color: Colors.grey[850],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: ListTile(
          leading: CircleAvatar(
            radius: 22.r,
            backgroundColor: color.withValues(alpha: 0.1),
            child: Icon(icon, color: color),
          ),
          title: Text(
            name,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You spent $usage on $name today',
                style: TextStyle(color: Colors.white60, fontSize: 13.sp),
              ),
              SizedBox(height: 6.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 6.h,
                  backgroundColor: Colors.grey[700],
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ),
            ],
          ),
          trailing: Icon(Icons.info_outline, color: Colors.white38),
        ),
      ),
    );
  }
}
