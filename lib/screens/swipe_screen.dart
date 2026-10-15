import 'package:flutter/material.dart';
import 'package:multiple_screens/main.dart';
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
      curve: Curves.easeInOut,
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
      body: PageView(
        controller: _controller,
        onPageChanged: _onPageChanged,
        children: const [
          Calculator(),
          HomeScreen(title: "Home"),
          BmiScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
       selectedIndex: _currentindex,
       onDestinationSelected: _onTabTapped,
       destinations: [
        NavigationDestination(icon: Icon(Icons.calculate), label: "Calculator"),
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        NavigationDestination(icon: Icon(Icons.accessibility_new), label: "BMI"),
       ],
        ),
    );
  }
}
