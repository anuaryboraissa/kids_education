import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:mathgame/src/data/models/sign.dart';
import 'package:mathgame/src/core/app_constant.dart';
import 'package:mathgame/src/ui/app/game_provider.dart';

class GuessSignProvider extends GameProvider<Sign> {
  final DifficultyType difficultyType;
  final String newSign;
  final String std;
  GuessSignProvider({
    required TickerProvider vsync,
    required this.difficultyType,
    required this.newSign,
    required this.std,
  }) : super(
          newSign: newSign,
          std: std,
          vsync: vsync,
          gameCategoryType: GameCategoryType.GUESS_SIGN,
          difficultyType: difficultyType,
        ) {
    startGame(newSign);
  }

  void checkResult(String answer) async {
    if (timerStatus != TimerStatus.pause) {
      result = answer;
      notifyListeners();
      if (result == currentState.sign) {
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
