
import '../constants/icons.dart';
import '../utils.dart';
class Category {
  String thumbnail;
  String name;
  int noOfCourses;

  Category({
    required this.name,
    required this.noOfCourses,
    required this.thumbnail,
  });
}

List<Category> categoryList = [
  Category(
    name: additionOperation,
    noOfCourses: 55,
    thumbnail: imgAdd,
  ),
  Category(
    name: subtractionOperation,
    noOfCourses: 20,
    thumbnail: imgSub,
  ),
  Category(
    name: multiplicationOperation,
    noOfCourses: 16,
    thumbnail: imgMul,
  ),
  Category(
    name: divisionOperation,
    noOfCourses: 25,
    thumbnail: imgDiv,
  ),
];
