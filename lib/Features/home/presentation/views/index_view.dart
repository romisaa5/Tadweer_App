import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toda_app/core/utils/styles.dart';

class IndexView extends StatelessWidget {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Hi, Romisaa',
            style: Styles.textStyle18,
          ),
          actions: [
            CircleAvatar(
              radius: 24.r,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(21.r),
                child: Image.asset('assets/images/profile.jpg',fit: BoxFit.fill,)),
            )
          ],
        ),
        body: Center(
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset('assets/images/home_image.png')
            ,
            Text('What do you want to do today?',style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w400),)
            ,
            Text('Tap + to add your tasks',style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w400),)
            ],
          
          ),
        ),
      ),
    );
  }
}
