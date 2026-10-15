import 'package:flutter/material.dart';

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
        body:Column(
           children: [
            Material(
              color: Colors.white,
              child: const  TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.blue,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                 Tab(text: "ForYou",),
                 Tab(text: "Following",)
                ]
                ),
            ),
            Expanded(child: TabBarView(children: [
              FeedList(title: "For You"),
              FeedList(title: "Following")
            ])
            )
           ],
        )
      ),
    );
  }
}

class FeedList extends StatefulWidget {
  final String title;
  const FeedList({super.key, required this.title});
  @override
  State<FeedList> createState() => _FeedListState();
}

class _FeedListState extends State<FeedList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
  super.build(context);
  return ListView.builder(
    itemCount: 30,
    itemBuilder: (context ,index)=>ListTile(
      leading: CircleAvatar(child: Icon(Icons.person)),
      title: Text("${widget.title} post $index"),
    )
    ) ;
  }
}
