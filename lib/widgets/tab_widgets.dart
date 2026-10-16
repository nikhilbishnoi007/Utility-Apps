import "package:flutter/material.dart";

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:multiple_screens/models/user_model.dart';

class ForYou extends StatefulWidget {
  const ForYou({super.key});
  @override
  State<ForYou> createState() => _ForYouState();
}

class _ForYouState extends State<ForYou> with AutomaticKeepAliveClientMixin {
  bool loading = true;
  List<User> users = [];
  Future<void> fetchUsers() async {
    try {
      final uri = Uri.parse(
        "https://dummydata-api-nkg8.onrender.com/api/users",
      );
      final res = await http.get(uri);
      final result = jsonDecode(res.body);
      if (res.statusCode == 200) {
        final list = result["data"] as List<dynamic>;
        final transform = list.map((l) {
          return User(
            id: l["id"],
            name: l['name'],
            city: l['city'],
            age: l['age'],
          );
        }).toList();
        if (!mounted) return;
        setState(() {
          users = transform;
          loading = false;
        });
      }
      else{
        setState(() {
          users=[];
          loading=false;
        });
      }
    } catch (e) {
      debugPrint('Error: $e');
      if (!mounted) return;
      setState(() => loading = false);
    }
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
    try {
      final uri = Uri.parse(
        "https://dummydata-api-nkg8.onrender.com/api/users?minAge=25",
      );
      final res = await http.get(uri);
      final result = jsonDecode(res.body);
      if (!mounted) return;
      if(res.statusCode==200){
      final list=result['data'] as List<dynamic>;
      final transform=list.map((l){
        return User(id: l['id'], name: l['name'], city: l['city'], age: l['age']);
      }).toList();
      setState(() {
        users = transform;
        loading = false;
      });
       }else{
         setState(() {
           users=[];
           loading=false;
         });
       }
    } catch (e) {
      if (!mounted) return;
      setState(() => loading = false);
    }
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
