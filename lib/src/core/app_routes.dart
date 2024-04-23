import 'package:flutter/material.dart';
import 'package:mathgame/src/core/app_constant.dart';
import 'package:mathgame/src/data/models/dashboard.dart';
import 'package:mathgame/src/ui/calculator/calculator_view.dart';
import 'package:mathgame/src/ui/correctAnswer/correct_answer_view.dart';
import 'package:mathgame/src/ui/dashboard/dashboard_view.dart';
import 'package:mathgame/src/ui/guessTheSign/guess_sign_view.dart';
import 'package:mathgame/src/ui/home/home_view.dart';
import 'package:mathgame/src/ui/magicTriangle/magic_triangle_view.dart';
import 'package:mathgame/src/ui/mathGrid/math_grid_view.dart';
import 'package:mathgame/src/ui/mathPairs/math_pairs_view.dart';
import 'package:mathgame/src/ui/mentalArithmetic/mental_arithmetic_view.dart';
import 'package:mathgame/src/ui/numberPyramid/number_pyramid_view.dart';
import 'package:mathgame/src/ui/picturePuzzle/picture_puzzle_view.dart';
import 'package:mathgame/src/ui/quickCalculation/quick_calculation_view.dart';
import 'package:mathgame/src/ui/squareRoot/square_root_view.dart';
import 'package:tuple/tuple.dart';

import '../dashboard/screens/welcome.dart';

var appRoutes = {
  KeyUtil.dashboard: (context) => DashboardView(
        tuple2: ModalRoute.of(context)?.settings.arguments
            as Tuple2<String, String>,
      ),
  KeyUtil.splash: (context) => SplashScreen(),
  KeyUtil.home: (context) => HomeView(
        tuple2: ModalRoute.of(context)?.settings.arguments
            as Tuple4<Dashboard, double,String,String>,
      ),
  KeyUtil.calculator: (context) => CalculatorView(
      colorTuple:
          ModalRoute.of(context)?.settings.arguments as Tuple4<Color, Color,String,String>),
  KeyUtil.guessSign: (context) => GuessSignView(
      colorTuple:
          ModalRoute.of(context)?.settings.arguments as Tuple4<Color, Color,String,String>),
  KeyUtil.correctAnswer: (context) => CorrectAnswerView(
      colorTuple:
          ModalRoute.of(context)?.settings.arguments as Tuple4<Color, Color,String,String>),
  KeyUtil.quickCalculation: (context) => QuickCalculationView(
      colorTuple:
          ModalRoute.of(context)?.settings.arguments as Tuple4<Color, Color,String,String>),
  KeyUtil.mentalArithmetic: (context) => MentalArithmeticView(
      colorTuple:
          ModalRoute.of(context)?.settings.arguments as Tuple4<Color, Color,String,String>),
  KeyUtil.squareRoot: (context) => SquareRootView(
      colorTuple:
          ModalRoute.of(context)?.settings.arguments as Tuple4<Color, Color,String,String>),
  KeyUtil.mathPairs: (context) => MathPairsView(
      colorTuple:
          ModalRoute.of(context)?.settings.arguments as Tuple4<Color, Color,String,String>),
  KeyUtil.magicTriangle: (context) => MagicTriangleView(
      colorTuple:
          ModalRoute.of(context)?.settings.arguments as Tuple4<Color, Color,String,String>),
  KeyUtil.mathGrid: (context) => MathGridView(
      colorTuple:
          ModalRoute.of(context)?.settings.arguments as Tuple4<Color, Color,String,String>),
  KeyUtil.picturePuzzle: (context) => PicturePuzzleView(
      colorTuple:
          ModalRoute.of(context)?.settings.arguments as Tuple4<Color, Color,String,String>),
  KeyUtil.numberPyramid: (context) => NumberPyramidView(
      colorTuple:
          ModalRoute.of(context)?.settings.arguments as Tuple4<Color, Color,String,String>),
};
