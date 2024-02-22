import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff6849ef);
const kPrimaryLight = Color(0xff8a72f1);
const Color kOtherColor = Color(0xFFF4F6F7);
CustomColor get baseBlue => const CustomColor(0xFF014560);

class AppSettings {
  static double get spacingUnit => 10.0;

  static double get messageSpacing => 10.0;

  static CustomColor get white => const CustomColor(0xfffcfcfc);

  static CustomColor get accent => const CustomColor(0xFF8bec02);

  static CustomColor get primary => const CustomColor(0xfffcfcfc);

  static CustomColor get transparent => const CustomColor(0x00071824);

  static CustomColor get darkBlue => const CustomColor(0xFF071824);

  static CustomColor get baseBlue => const CustomColor(0xFF014560);

  static CustomColor get lightBlue => const CustomColor(0xFF29abe2);

  static CustomColor get baseGreen => const CustomColor(0xFF006e00);

  static CustomColor get lightGreen2 => const CustomColor(0xFF32db64);

  static CustomColor get green => const CustomColor(0xFF259a59);

  static CustomColor get darkRed => const CustomColor(0xFF852020);
}
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