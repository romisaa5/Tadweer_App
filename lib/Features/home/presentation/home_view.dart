import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toda_app/Features/home/logic/provider/task_provider.dart';
import 'package:toda_app/Features/home/presentation/views/calander_view.dart';
import 'package:toda_app/Features/home/presentation/views/focus_view.dart';
import 'package:toda_app/Features/home/presentation/views/index_view.dart';
import 'package:toda_app/Features/home/presentation/views/profie_view.dart';
import 'package:toda_app/Features/home/presentation/widgets/add_tasks_bottom_sheet.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/generated/l10n.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  List<Widget> tabs = [IndexView(), CalanderView(), FocusView(), ProfileView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Provider.of<TaskProvider>(context)
                .selectDate
                .isBefore(DateTime.now().subtract(Duration(days: 1)))
            ? Colors.grey
            : ColorsManger.kPrimaryColor,
        onPressed: Provider.of<TaskProvider>(context)
                .selectDate
                .isBefore(DateTime.now().subtract(Duration(days: 1)))
            ? null
            : () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.0),
                    ),
                  ),
                  builder: (context) {
                    return AddTasksBottomSheet();
                  },
                );
              },
        shape: const StadiumBorder(),
        child: const Icon(
          Icons.add,
          size: 25,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(top: 16.0.h, bottom: 8.0.h),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          currentIndex: currentIndex,
          onTap: (tappedIndex) {
            setState(() {
              currentIndex = tappedIndex;
            });
          },
          selectedItemColor: ColorsManger.kPrimaryColor,
          unselectedItemColor: const Color.fromARGB(255, 158, 157, 158),
          elevation: 0,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 24,
              ),
              label: S.of(context).Index,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month_outlined,
                size: 24,
              ),
              label: S.of(context).Calendar,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.access_time_outlined,
                size: 24,
              ),
              label: S.of(context).Focus,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 24,
              ),
              label: S.of(context).Profile,
            ),
          ],
        ),
      ),
    );
  }
}
