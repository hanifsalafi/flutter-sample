import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  int id;
  String firstName;
  String lastName;
  String email;

  User({this.id, this.firstName, this.lastName, this.email});

  factory User.createUser(Map<String, dynamic> object) {
    return User(
        id: object['id'],
        firstName: object['first_name'],
        lastName: object['last_name'],
        email: object['email']);
  }

  static Future<List<User>> getUsers(String page) async {
    String url = "https://reqres.in/api/users?page=" + page;

    var apiResult = await http.get(url);
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> userList = (jsonObject as Map<String, dynamic>)['data'];

    List<User> users = [];
    for (int i = 0; i < userList.length; i++) {
      users.add(User.createUser(userList[i]));
    }

    return users;
  }

  static Future<User> requestAPI(String id) async {
    String url = "https://reqres.in/api/users/" + id;

    var apiResult = await http.get(url);

    var jsonObject = json.decode(apiResult.body);

    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return User.createUser(userData);
  }
}
