import "package:flutter/material.dart";

import 'package:multiple_screens/models/user_model.dart';
import 'package:multiple_screens/services/userapi.dart';

class ForYou extends StatefulWidget {
  const ForYou({super.key});
  @override
  State<ForYou> createState() => _ForYouState();
}

class _ForYouState extends State<ForYou> with AutomaticKeepAliveClientMixin {
  bool loading = true;
  List<User> users = [];
  Future<void> fetchUsers() async {
    final response=await UserApi.fetchUsers();
    setState(() {
      users=response;
      loading=false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (loading) return const Center(child: CircularProgressIndicator());
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          margin: EdgeInsets.all(12),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(user.name),
            subtitle: Text(user.city),
            trailing: Text("${user.age}"),
          ),
        );
      },
    );
  }
}

class Following extends StatefulWidget {
  const Following({super.key});
  @override
  State<Following> createState() => _FollowingState();
}

class _FollowingState extends State<Following>
    with AutomaticKeepAliveClientMixin {
  List<User> users = [];
  bool loading = true;
  Future<void> getUsers() async {
    final respone=await UserApi.getUsers();
    setState(() {
      users=respone;
      loading=false;
    });
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (loading) return Center(child: CircularProgressIndicator());
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index){
        final user=users[index];
        return  Card(
        margin: EdgeInsets.all(12),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        child: ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(user.name),
          subtitle: Text(user.city),
          trailing: Text("${user.age}"),
        ),
      );
      }
    );
  }
}
