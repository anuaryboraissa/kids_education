// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

class Group {
  String name;
  int id;
  String description;
  Uint8List? icon;
  String createdAt;
  int members;
  String level;
  String supervisor;
  Group({
    required this.name,
    required this.id,
    required this.description,
    this.icon,
    required this.createdAt,
    required this.members,
    required this.level,
    required this.supervisor,
  });
}

List<Group> groups = [
  Group(
      id: 1,
      name: "Addition Level2",
      description: "All members willingly and included",
      icon: null,
      createdAt: "2023-03-12",
      members: 4,
      level: "1",
      supervisor: "Anuary"),
  Group(
      id: 2,
      name: "Subtraction Level2",
      description: "All members willingly,satisfied",
      icon: null,
      createdAt: "2023-05-26",
      members: 3,
      level: "2",
      supervisor: "Kitihu"),
  Group(
      id: 3,
      name: "Division Level1",
      description: "All members willingly required",
      icon: null,
      createdAt: "2023-07-05",
      members: 2,
      level: "2",
      supervisor: "John"),
  Group(
      id: 4,
      name: "Division Level2",
      description: "All members willingly accepted",
      icon: null,
      createdAt: "2023-02-22",
      members: 1,
      level: "1",
      supervisor: "Nashon"),
  Group(
      id: 5,
      name: "Subtraction Level2",
      description: "All members willingly to contribute",
      icon: null,
      createdAt: "2023-03-07",
      members: 5,
      level: "6",
      supervisor: "Iddi"),
  Group(
      id: 6,
      name: "Addition Level6",
      description: "All members willingly to participate",
      icon: null,
      createdAt: "2023-03-16",
      members: 4,
      level: "1",
      supervisor: "Bora"),
];
