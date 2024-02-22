
import '../constants/icons.dart';

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
    name: 'Addition',
    noOfCourses: 55,
    thumbnail: imgAdd,
  ),
  Category(
    name: 'Subtraction',
    noOfCourses: 20,
    thumbnail: imgSub,
  ),
  Category(
    name: 'Multiplication',
    noOfCourses: 16,
    thumbnail: imgMul,
  ),
  Category(
    name: 'Division',
    noOfCourses: 25,
    thumbnail: imgDiv,
  ),
];
