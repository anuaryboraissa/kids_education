// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mathgame/src/dashboard/models/group.dart';

class User {
  String name;
  String phone;
  String address;
  int id;
  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
  });
}

class UserGroups {
  int group;
  int user;
  String joinedAt;
  bool active;
  UserGroups({
    required this.group,
    required this.user,
    required this.joinedAt,
    required this.active,
  });
}


List<User> appUsers=[
  User(id: 1, name: "Anuary Issa", phone: "+2557536253423", address: "Babati"),
  User(id: 2, name: "Anuary Bora", phone: "+2557536253423", address: "Iringa"),
  User(id: 3, name: "Athumani Bora", phone: "+2557536253423", address: "Dodoma"),
  User(id: 4, name: "Awadhi Husein", phone: "+2557536253423", address: "Tihu"),
  User(id: 5, name: "Idi IAhmad", phone: "+2557536253423", address: "Dar"),
  User(id: 6, name: "Kessy Yahhi", phone: "+2557536253423", address: "India"),
  User(id: 7, name: "Balekha Issa", phone: "+2557536253423", address: "Mecho"),
  User(id: 8, name: "Hassan Ramadhani", phone: "+2557536253423", address: "Mbinga"),
  User(id: 9, name: "Batuli Mohamed ", phone: "+2557536253423", address: "Kilui"),
  User(id: 10, name: "John Doe", phone: "+2557536253423", address: "Kiluvya"),
  User(id: 11, name: "Amani Johe", phone: "+2557536253423", address: "Khaliba"),
  User(id: 12, name: "Kilindi Hamisi", phone: "+2557536253423", address: "Babati"),
  User(id: 13, name: "Yeri Bahi", phone: "+2557536253423", address: "Babati"),
  User(id: 14, name: "Iddi Shabani", phone: "+2557536256553", address: "Babati"),

];


List<UserGroups> userGroups=[
  UserGroups(group: 1, user: 3, joinedAt: "2020-10-19 20:99", active: true),
  UserGroups(group: 5, user: 7, joinedAt: "2020-10-19 20:99", active: true),
  UserGroups(group: 1, user: 5, joinedAt: "2020-10-19 20:99", active: true),
  UserGroups(group: 6, user: 13, joinedAt: "2020-10-19 20:99", active: true),
  UserGroups(group: 6, user: 9, joinedAt: "2020-10-19 20:99", active: true),
  UserGroups(group: 4, user: 11, joinedAt: "2020-10-19 20:99", active: true),
  UserGroups(group: 3, user: 10, joinedAt: "2020-10-19 20:99", active: true),
];
