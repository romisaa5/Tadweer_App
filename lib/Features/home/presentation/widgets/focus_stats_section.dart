import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/generated/l10n.dart';
import 'package:app_usage/app_usage.dart';

class FocusStatsSection extends StatefulWidget {
  const FocusStatsSection({super.key});

  @override
  _FocusStatsSectionState createState() => _FocusStatsSectionState();
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

      setState(() {
        _appUsageList = usageData;
      });
    } on Exception catch (e) {
      debugPrint('App usage error: $e');
    }
  }

  String formatUsage(Duration usage) {
    if (usage.inMinutes < 60) {
      return '${usage.inMinutes}m';
    } else {
      return '${usage.inHours}h ${usage.inMinutes.remainder(60)}m';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40.h),
        // FocusChart(),
        SizedBox(height: 30.h),
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
            final appName = appUsage.appName;
            final usage = formatUsage(appUsage.usage);
            final icon = appIcons[appName] ?? Icons.apps;
            final color = appColors[appName] ?? Colors.blueGrey;

            return _buildAppTile(
              appName,
              'You spent $usage on $appName today',
              icon,
              color,
            );
          }).toList(),
        SizedBox(height: 30),
      ],
    );
  }

  Widget _buildAppTile(String name, String usage, IconData icon, Color color) {
    return Card(
      color: Colors.grey[850],
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        title: Text(name, style: TextStyle(color: Colors.white)),
        subtitle: Text(usage, style: TextStyle(color: Colors.white60)),
        trailing: Icon(Icons.info_outline, color: Colors.white38),
      ),
    );
  }
}
