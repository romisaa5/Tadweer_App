import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/generated/l10n.dart';

class IndexView extends StatelessWidget {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context) {
        final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Hi, Romisaa',
            style: Styles.textStyle18
            .copyWith(
              color: textTheme.bodyLarge!.color,
            ),
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
            spacing: 10.h,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset('assets/images/home_image.png')
            ,
            Text(S.of(context).Whatdoyouwanttodotoday,style: Styles.textStyle20.copyWith(
              color: textTheme.bodyLarge!.color,
            ),)
            ,
            Text(S.of(context).Taptoaddyourtasks,style: Styles.textStyle16.copyWith(
              color: textTheme.bodyMedium?.color?.withOpacity(0.7),
            ),)
            
            
            
            ],
          
          ),
        ),
      ),
    );
  }
}
