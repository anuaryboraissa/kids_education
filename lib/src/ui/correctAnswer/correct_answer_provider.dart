import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:mathgame/src/data/models/correct_answer.dart';
import 'package:mathgame/src/core/app_constant.dart';
import 'package:mathgame/src/ui/app/game_provider.dart';

class CorrectAnswerProvider extends GameProvider<CorrectAnswer> {
  late String result;
  late String newSign;
  late String std;
  final DifficultyType difficultyType;

  CorrectAnswerProvider({
    required TickerProvider vsync,
    required this.difficultyType,
    required this.newSign,
    required this.std,
  }) : super(
          newSign: newSign,
          std: std,
          vsync: vsync,
          gameCategoryType: GameCategoryType.CORRECT_ANSWER,
          difficultyType: difficultyType,
        ) {
    startGame(newSign);
  }

  Future<void> checkResult(String answer) async {
    if (timerStatus != TimerStatus.pause) {
      result = answer;
      notifyListeners();
      if (int.parse(result) == currentState.answer) {
        await Future.delayed(Duration(milliseconds: 300));
        loadNewDataIfRequired(newSign);
        if (timerStatus != TimerStatus.pause) {
          restartTimer();
        }
        notifyListeners();
      } else {
        wrongAnswer();
      }
    }
  }
}
