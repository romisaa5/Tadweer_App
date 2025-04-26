import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toda_app/Features/home/presentation/widgets/category_selector.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/generated/l10n.dart';

class SelectDateandcategory extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  final Function(String) onCategorySelected;

  const SelectDateandcategory({
    super.key,
    required this.onDateSelected,
    required this.onCategorySelected,
  });

  @override
  State<SelectDateandcategory> createState() => _SelectDateandcategoryState();
}

class _SelectDateandcategoryState extends State<SelectDateandcategory> {
  DateTime initialDate = DateTime.now();
  DateFormat formattedDate = DateFormat('dd-MM-yyyy');
  String selectedCategory = "";

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
            TextButton(
              onPressed: () async {
                var date = await showDatePicker(
                  context: context,
                  initialDate: initialDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 366)),
                  builder: (context, child) => child!,
                );
                if (date != null) {
                  setState(() {
                    initialDate = date;
                    widget.onDateSelected(initialDate); // نبعته للأب
                  });
                }
              },
              child: Icon(Icons.alarm_outlined),
            ),
            Text(formattedDate.format(initialDate)),
          ],
        ),
        Column(
          children: [
            Text(
              S.of(context).SelectCatogry,
              style: Styles.textStyle14.copyWith(color: colorScheme.secondary),
            ),
            TextButton(
              onPressed: () async {
                final result = await showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  backgroundColor: colorScheme.background,
                  builder: (context) => CategorySelector(),
                );
                if (result != null) {
                  setState(() {
                    selectedCategory = result;
                    widget.onCategorySelected(selectedCategory); // نبعته للأب
                  });
                }
              },
              child: Icon(Icons.category_outlined),
            ),
            Text(selectedCategory),
          ],
        ),
      ],
    );
  }
}
