//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:flutter_rebuild/users_model.dart';
import 'dart:convert';



List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));
String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Users {
    Users({
        required this.users,
    });
    List<User> users;
    
    factory Users.fromJson(Map<String, dynamic> json) => Users(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
    };
}


class User {
    User({
        this.name,
        this.age,
        this.degree,
    });

    String? name;
    String? age;
    String? degree;

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        age: json["age"],
        degree: json["degree"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "degree": degree,
    };
}