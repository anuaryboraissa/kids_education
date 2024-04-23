// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mathgame/src/dashboard/utils.dart';

class Level {
  String name;
  String description;
  String icon;
  Level({
    required this.name,
    required this.description,
    required this.icon,
  });
}


List<Level> levels=[
  Level(name: "Standard One", description: "Standard one all students", icon: level1),
  Level(name: "Standard Two", description: "Standard two all students", icon: level2),
  Level(name: "Standard Three", description: "Standard three all students", icon: level3),
  Level(name: "Standard Four", description: "Standard four all students", icon:level4),
];