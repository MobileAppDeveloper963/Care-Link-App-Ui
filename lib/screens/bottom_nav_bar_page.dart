import 'package:animate_do/animate_do.dart';
import 'package:care_link_app/controllers/bottom_bar_controller.dart';
import 'package:care_link_app/screens/calendar_page.dart';
import 'package:care_link_app/screens/home_page.dart';
import 'package:care_link_app/screens/message_page.dart';
import 'package:care_link_app/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class BottomNavBarPage extends StatelessWidget {
  BottomNavBarPage({super.key});

  BottomBarController controller = Get.put(BottomBarController());

  List pages = [
    HomePage(),
    CalendarPage(),
    MessagePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.white,
            currentIndex: controller.bottomBarIndex.value,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: (value) => controller.bottomBarIndex.value = value,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month_outlined), label: 'Calender'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message_outlined), label: 'Message'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined), label: 'Profile'),
            ]),
      ),
      body: Obx(
        () => pages[controller.bottomBarIndex.value],
      ),
    );
  }
}
