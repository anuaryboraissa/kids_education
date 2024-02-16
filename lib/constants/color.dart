import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff6849ef);
const kPrimaryLight = Color(0xff8a72f1);
const Color kOtherColor = Color(0xFFF4F6F7);
CustomColor get baseBlue => const CustomColor(0xFF014560);
class CustomColor extends Color {
  const CustomColor.fromARGB(int a, int r, int g, int b)
      : super.fromARGB(a, r, g, b);

  const CustomColor.fromRGBO(int r, int g, int b, double opacity)
      : super.fromRGBO(r, g, b, opacity);

  const CustomColor(int value) : super(value);

  Color withBrightNess(int amount) {
    return Color.fromARGB(alpha, red + amount, green + amount, blue + amount);
  }
}