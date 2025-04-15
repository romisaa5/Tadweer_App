import 'package:flutter/material.dart';
import 'package:toda_app/Features/home/presentation/widgets/focus_chart.dart';
import 'package:toda_app/core/themes/colors.dart';

class FocusStatsSection extends StatelessWidget {
  const FocusStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40),
          FocusChart(),
        SizedBox(height: 30),
        Text(
          'Applications',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),

        SizedBox(height: 10),
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
