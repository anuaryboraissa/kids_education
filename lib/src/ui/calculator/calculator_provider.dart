import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:mathgame/src/data/models/calculator.dart';
import 'package:mathgame/src/core/app_constant.dart';
import 'package:mathgame/src/ui/app/game_provider.dart';

class CalculatorProvider extends GameProvider<Calculator> {
  late String result;
  late String newSign;
  late String std;
  final DifficultyType difficultyType;

  CalculatorProvider({
    required TickerProvider vsync,
    required this.difficultyType,
    required this.newSign,
    required this.std,
  }) : super(
          newSign: newSign,
          std: std,
          vsync: vsync,
          gameCategoryType: GameCategoryType.CALCULATOR,
          difficultyType: difficultyType,
        ) {
    startGame(newSign);
  }

  void checkResult(String answer) async {
    if (result.length < currentState.answer.toString().length &&
        timerStatus != TimerStatus.pause) {
      result = result + answer;
      notifyListeners();
      if (int.parse(result) == currentState.answer) {
        await Future.delayed(Duration(milliseconds: 300));
        loadNewDataIfRequired(newSign);
        if (timerStatus != TimerStatus.pause) {
          restartTimer();
        }
        notifyListeners();
      } else if (result.length == currentState.answer.toString().length) {
        wrongAnswer();
      }
    }
  }

  void backPress() {
    if (result.length > 0) {
      result = result.substring(0, result.length - 1);
      notifyListeners();
    }
  }

  void clearResult() {
    result = "";
    notifyListeners();
  }
}
