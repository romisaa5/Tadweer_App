import 'package:flutter/material.dart';
import 'package:toda_app/core/themes/colors.dart';

class CustomScaffoldBg extends StatelessWidget {
  const CustomScaffoldBg({super.key, this.body, this.appBar});
final Widget? body;
final PreferredSizeWidget? appBar;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorsManger.kPrimaryColor,
            ColorsManger.bgcolorDark,
          ],
          stops: const [0.3, 0.3],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          
        ),
      ),
      child: Scaffold(
        appBar:appBar ,
        backgroundColor: Colors.transparent,
        body: body
         ,
      ),
    );
  }
}