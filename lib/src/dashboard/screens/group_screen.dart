import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/group.dart';
import '../widgets/group_overview.dart';
import 'chat_screen.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Groups',
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
                      horizontal: 10.0, vertical: 10),
                  separatorBuilder: (_, __) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  shrinkWrap: true,
                  itemBuilder: (_, int index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ChatScreen(),
                          ));
                        },
                        child: GroupWidget(group: groups[index]));
                  },
                  itemCount: groups.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
