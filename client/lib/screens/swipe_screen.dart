import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:multiple_screens/main.dart';
import 'package:multiple_screens/screens/tab_screen.dart';
import 'package:multiple_screens/screens/bmi_screen.dart';
import 'package:multiple_screens/screens/calculator_screen.dart';

class SwipeScreens extends StatefulWidget {
  const SwipeScreens({super.key});
  @override
  State<SwipeScreens> createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreens> {
  final PageController _controller = PageController(initialPage: 1);
  int _currentindex = 1;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    _controller.animateToPage(
      index,
      duration: const Duration(microseconds: 600),
      curve: Curves.easeInCubic,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _controller,
        onPageChanged: _onPageChanged,
        children: const [
          Calculator(),
          HomeScreen(title: "Home"),
          BmiScreen(),
          TabScreen(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.fromLTRB(12, 14, 8, 16),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: NavigationBarTheme(
              data: NavigationBarThemeData(
                backgroundColor: Colors.black.withValues(alpha: 0.35),
                surfaceTintColor: Colors.transparent,
                indicatorColor: Colors.white24,
                iconTheme: WidgetStateProperty.all(
                  const IconThemeData(color: Colors.white),
                ),
                labelTextStyle: WidgetStateProperty.all(
                  const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              child: NavigationBar(
                // backgroundColor: Colors.transparent,
                elevation: 0,
                selectedIndex: _currentindex,
                onDestinationSelected: _onTabTapped,
                destinations: [
                  NavigationDestination(
                    icon: Icon(Icons.calculate),
                    label: "Calculator",
                  ),
                  NavigationDestination(icon: Icon(Icons.home), label: "Home"),
                  NavigationDestination(
                    icon: Icon(Icons.accessibility_new),
                    label: "BMI",
                  ),
                  NavigationDestination(icon: Icon(Icons.tab), label: "Tabs"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
