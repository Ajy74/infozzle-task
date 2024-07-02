
import 'package:flutter/material.dart';
import 'package:infozzle_task/configs/color/color.dart';
import 'package:infozzle_task/views/views.dart';


class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {

  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const SupportScreen()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Placeholder();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: _screens[_currentIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: AppColor.buttonColor,
        backgroundColor: AppColor.whiteColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.space_dashboard_rounded),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_support_rounded),
            label: 'Support',
          ),
        ],
      ),
    );
  }
}