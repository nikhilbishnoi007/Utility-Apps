import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:multiple_screens/models/user_model.dart';
class UserApi{
  static Future<List<User>> fetchUsers() async {
      final uri = Uri.parse(
        "https://dummydata-api-nkg8.onrender.com/api/users",
      );
      final res = await http.get(uri);
      final result = jsonDecode(res.body);
        final list = result["data"] as List<dynamic>;
        final transform = list.map((l) {
          return User(
            id: l["id"],
            name: l['name'],
            city: l['city'],
            age: l['age'],
          );
        }).toList();
       return transform;
     
  }
  static Future<List<User>> getUsers() async{
    final uri=Uri.parse("https://dummydata-api-nkg8.onrender.com/api/users?minAge=25");
    final res=await http.get(uri);
    final result=jsonDecode(res.body) ;
    final list=result['data'] as List<dynamic>;
    final transform=list.map((l){
      return User(
        id: l['id'], 
        name: l['name'], 
        city: l['city'], 
        age: l['age']);
    }).toList();
    return transform ;
  }
}