// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  Level(name: "Standard One", description: "Standard one all students", icon: "STD1"),
  Level(name: "Standard Two", description: "Standard two all students", icon: "STD2"),
  Level(name: "Standard Three", description: "Standard three all students", icon: "STD3"),
  Level(name: "Standard Four", description: "Standard four all students", icon: "STD4"),
];