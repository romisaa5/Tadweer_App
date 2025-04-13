import 'package:flutter/material.dart';
import 'package:toda_app/Features/home/presentation/widgets/task_card.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/themes/text_styles.dart';

class CalanderView extends StatelessWidget {
  const CalanderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: ColorsManger.kPrimaryColor,
        automaticallyImplyLeading: false,
        title: Text('Calender',style: Styles.textStyle18.copyWith(color: Colors.white),),
        
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => TaskCard(),
    ));
  }
}