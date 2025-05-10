import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/core/widgets/custom_button.dart';
import 'package:toda_app/generated/l10n.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key, required this.onCategorySelected});

  final Function(String) onCategorySelected;
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'name': S.of(context).categoryGrocery,
        'icon': Icons.local_grocery_store,
        'color': Colors.greenAccent,
      },
      {
        'name': S.of(context).categoryWork,
        'icon': Icons.work,
        'color': Colors.deepOrange,
      },
      {
        'name': S.of(context).categorySport,
        'icon': Icons.fitness_center,
        'color': Colors.cyanAccent,
      },
      {
        'name': S.of(context).categoryDesign,
        'icon': Icons.design_services,
        'color': Colors.teal,
      },
      {
        'name': S.of(context).categoryUniversity,
        'icon': Icons.school,
        'color': Colors.blue,
      },
      {
        'name': S.of(context).categorySocial,
        'icon': Icons.campaign,
        'color': Colors.pink,
      },
      {
        'name': S.of(context).categoryMusic,
        'icon': Icons.music_note,
        'color': Colors.purpleAccent,
      },
      {
        'name': S.of(context).categoryHealth,
        'icon': Icons.favorite,
        'color': Colors.lightGreenAccent,
      },
      {
        'name': S.of(context).categoryMovie,
        'icon': Icons.movie,
        'color': Colors.lightBlue,
      },
    ];

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.of(context).SelectCatogry,
            style: Styles.textStyle18.copyWith(color: colorScheme.secondary),
          ),
          Divider(color: Colors.grey[200]),
          SizedBox(height: 20.h),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            childAspectRatio: 1,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: categories.map((cat) {
              return GestureDetector(
                onTap: () {
                  onCategorySelected(cat['name']);
                },
                child: Container(
                  height: 100,
                  width: 50,
                  decoration: BoxDecoration(
                    color: cat['color'],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(cat['icon'], color: Colors.black),
                      SizedBox(height: 8),
                      Text(cat['name'], style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                text: S.of(context).Cancel,
                color: ColorsManger.kPrimaryColor,
                width: MediaQuery.of(context).size.width * .5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
