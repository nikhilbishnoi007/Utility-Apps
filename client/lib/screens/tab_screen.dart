import 'package:flutter/material.dart';
import 'package:multiple_screens/widgets/tab_widgets.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tab"),
          backgroundColor: const Color.fromARGB(255, 237, 238, 240),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Material(
              color: Colors.white,
              child: const TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.blue,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "ForYou"),
                  Tab(text: "Following"),
                ],
              ),
            ),
            Expanded(child: TabBarView(children: [ForYou(),Following()])),
          ],
        ),
      ),
    );
  }
}
