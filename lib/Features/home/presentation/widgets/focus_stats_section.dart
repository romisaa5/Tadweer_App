import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toda_app/Features/home/presentation/widgets/focus_chart.dart';
import 'package:toda_app/core/themes/text_styles.dart';


class FocusStatsSection extends StatelessWidget {
  const FocusStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40.h),
          FocusChart(),
        SizedBox(height: 30.h),
        Text(
          'Applications',
          style:Styles.textStyle16.copyWith(
            color: colorScheme.secondary,
            fontWeight: FontWeight.w600,
            
          ),
        ),

        SizedBox(height: 10.h),
        _buildAppTile('Facebook', 'You spent 1h on Facebook today',
            Icons.facebook, Colors.blue),
        _buildAppTile('Telegram', 'You spent 30m on Telegram today',
            Icons.telegram, Colors.blueAccent),
        _buildAppTile('Gmail', 'You spent 45m on Gmail today',
            Icons.email, Colors.redAccent),
        _buildAppTile('Instagram', 'You spent 4h on Instagram today',
            Icons.camera_alt, Colors.pink),
        _buildAppTile('Twitter', 'You spent 3h on Twitter today',
            Icons.alternate_email, Colors.lightBlue),
        
        SizedBox(height: 30),
      ],
    );
  }

  Widget _buildAppTile(
      String name, String usage, IconData icon, Color color) {
    return Card(
      color: Colors.grey[850],
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues( alpha: .2),
          child: Icon(icon, color: color),
        ),
        title: Text(name, style: TextStyle(color: Colors.white)),
        subtitle: Text(usage, style: TextStyle(color: Colors.white60)),
        trailing: Icon(Icons.info_outline, color: Colors.white38),
      ),
    );
  }
}
