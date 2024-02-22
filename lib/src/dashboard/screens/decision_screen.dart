import 'package:flutter/material.dart';
import 'package:mathgame/src/core/app_constant.dart';
import 'package:mathgame/src/dashboard/widgets/custom_button.dart';

import '../widgets/custom_back_button.dart';

class DecisionScreen extends StatefulWidget {
  const DecisionScreen({super.key});

  @override
  State<DecisionScreen> createState() => _DecisionScreenState();
}

class _DecisionScreenState extends State<DecisionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton(
            title: "GAME",
            callback: () {
              Navigator.of(context).pushNamed(KeyUtil.dashboard);
            },
          ),
          CustomButton(
            title: "QUIZ",
            callback: () {},
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomBackButton(parentContext: context),
          ),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              children: [ 
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "What are you want to take ?",
                  style: TextStyle(fontSize: 25),
                ),
                 const SizedBox(
                  height: 10,
                ),
                Text("""
             "Quiz: Test your knowledge and skills with our interactive quizzes. Challenge yourself and learn in a fun way!"
            
            "Game: Dive into exciting and engaging games designed to make learning enjoyable. Explore new concepts while having fun!"
                 """),
              ],
            ),
          )
        ],
      )),
    );
  }
}
