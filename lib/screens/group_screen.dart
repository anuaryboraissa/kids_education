import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/course.dart';
import 'details_screen.dart';
import 'levels.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Groups',
                      style: Theme.of(context).textTheme.displayMedium,
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
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    separatorBuilder: (_, __) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    shrinkWrap: true,
                    itemBuilder: (_, int index) {
                      return CourseContainer(
                        course: courses[index],
                      );
                    },
                    itemCount: courses.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
