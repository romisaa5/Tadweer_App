import 'package:flutter/material.dart';
import 'package:toda_app/Features/home/presentation/widgets/category_selector.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/generated/l10n.dart';

class SelectDateandcategory extends StatelessWidget {
  const SelectDateandcategory({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              S.of(context).SelectDate,
              style: Styles.textStyle14.copyWith(color: colorScheme.secondary),
            ),
            TextButton(onPressed: () {}, child: Icon(Icons.alarm_outlined)),
          ],
        ),
        Column(
          children: [
            Text(
              S.of(context).SelectCatogry,
              style: Styles.textStyle14.copyWith(color: colorScheme.secondary),
            ),
            TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    backgroundColor: colorScheme.background,
                    builder: (context) {
                      return CategorySelector();
                    },
                  );
                },
                child: Icon(Icons.category_outlined)),
          ],
        )
      ],
    );
  }
}
