import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toda_app/Features/home/logic/provider/task_provider.dart';
import 'package:toda_app/Features/home/presentation/widgets/custom_scaffold_bg.dart';
import 'package:toda_app/Features/home/presentation/widgets/task_card.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:intl/intl.dart';
import 'package:toda_app/generated/l10n.dart';

class CalanderView extends StatefulWidget {
  const CalanderView({super.key});

  @override
  State<CalanderView> createState() => _CalanderViewState();
}

class _CalanderViewState extends State<CalanderView> {
  EasyDatePickerController? controller = EasyDatePickerController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TaskProvider>().getTasksByDate();
    });
  }

  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TaskProvider>().tasks;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    var provider = Provider.of<TaskProvider>(context);

    return CustomScaffoldBg(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorsManger.kPrimaryColor,
        title: Text(
          S.of(context).Calendar,
          style: Styles.textStyle24.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          EasyDateTimeLinePicker.itemBuilder(
            controller: controller,
            firstDate: DateTime(2025, 1, 1),
            currentDate: DateTime.now(),
            lastDate: DateTime(2030, 3, 18),
            focusedDate: provider.selectDate,
            itemExtent: 70.0.sp,
            itemBuilder:
                (context, date, isSelected, isDisabled, isToday, onTap) {
              return InkResponse(
                onTap: onTap,
                child: Container(
                  width: 35.0.w,
                  height: 45.0.h,
                  decoration: BoxDecoration(
                    color:
                        isSelected ? ColorsManger.kPrimaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border:
                        Border.all(color: colorScheme.secondary, width: 1.0),
                  ),
                  child: Column(
                    spacing: 8.0.h,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(DateFormat.MMM().format(date),
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                          )),
                      Text(
                        date.day.toString(),
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      Text(
                        DateFormat.E().format(date),
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            onDateChange: (newDate) {
              provider.changeSelectedDate(newDate);
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: tasks.isEmpty
                ? Column(
                    spacing: 5.h,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      Image.asset(
                        'assets/images/checklist.png',
                        height: 80.h,
                        width: 70.w,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        S.of(context).NotasksforThisday,
                        style: Styles.textStyle18.copyWith(
                          color: colorScheme.secondary,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        S.of(context).LetsaddsomeTasksandstayproductive,
                        style: Styles.textStyle16.copyWith(color: Colors.grey),
                      ),
                    ],
                  )
                : ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (_, index) {
                      return TaskCard(taskModel: tasks[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
