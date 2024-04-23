import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mathgame/src/dashboard/screens/decision_screen.dart';

import '../models/level.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/custom_card.dart';

class LevelScreen extends StatefulWidget {
  const LevelScreen({super.key, required this.operation});
  final String operation;

  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Theme.of(context).brightness == Brightness.dark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.operation.isNotEmpty) ...[
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomBackButton(parentContext: context),
                    ),
                    Text(
                      'Choose level',
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
               
              ] else
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Levels',
                        style: TextStyle(fontSize: 25),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search,
                              )),
                          const SizedBox(
                            width: 5,
                          ),
                          PopupMenuButton(
                            itemBuilder: (context) => ["item 1", "item 2"]
                                .map((e) => PopupMenuItem(child: Text(e)))
                                .toList(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  separatorBuilder: (_, __) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  shrinkWrap: true,
                  itemBuilder: (_, int index) {
                    Level level = levels[index];
                    return GestureDetector(
                      onTap: () {
                        debugPrint("OP: ${widget.operation}      ========>  ");
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>  DecisionScreen(level: level.icon, op: widget.operation,),
                        ));
                      },
                      child: CustomCard(
                        leading: level.icon,
                        subtitle: level.description,
                        title: level.name,
                      ),
                    );
                  },
                  itemCount: levels.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
