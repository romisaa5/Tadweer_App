import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:toda_app/Features/home/presentation/widgets/custom_scaffold_bg.dart';
import 'package:toda_app/Features/home/presentation/widgets/task_card.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:intl/intl.dart';

class CalanderView extends StatefulWidget {
  const CalanderView({super.key});

  @override
  State<CalanderView> createState() => _CalanderViewState();
}

class _CalanderViewState extends State<CalanderView> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return CustomScaffoldBg(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorsManger.kPrimaryColor,
        title: Text(
          'Calander',
          style: Styles.textStyle18.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          EasyDateTimeLinePicker.itemBuilder(
            firstDate: DateTime(2025, 1, 1),
            currentDate: selectedDate,
            lastDate: DateTime(2030, 3, 18),
            focusedDate: selectedDate,
            itemExtent: 70.0,
            itemBuilder:
                (context, date, isSelected, isDisabled, isToday, onTap) {
              return InkResponse(
                onTap: onTap,
                child: Container(
                  width: 35.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color:
                        isSelected ? ColorsManger.kPrimaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: isSelected
                        ? Border.all(color: ColorsManger.bgcolorLight)
                        : null,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(date.day.toString(),
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                          )),
                      Text(DateFormat.MMM().format(date),
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                          )),
                    ],
                  ),
                ),
              );
            },
            onDateChange: (date) {
              setState(() {
                selectedDate = date;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (_, index) {
              return TaskCard();
            }),
          ),
        ],
      ),
    );
  }
}
