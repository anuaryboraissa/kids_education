import "package:flutter/material.dart";

import "../constants/color.dart";
import "../models/group.dart";
import "../utils.dart";

class GroupWidget extends StatelessWidget {
  const GroupWidget({super.key, required this.group});
  final Group group;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFa0a0a0), width: 1.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 6.0, 16.0, 6.0),
              child: Stack(
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border:
                          Border.all(color: AppSettings.darkBlue, width: 2.0),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Center(
                        child: group.icon == null
                            ? const Icon(Icons.groups_2_outlined)
                            : Image.memory(group.icon!)),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: AppSettings.baseBlue,
                        radius: 8,
                        child: Center(
                            child: group.members < 5
                                ? Icon(
                                    Icons.check,
                                    color: AppSettings.white,
                                    size: 12,
                                  )
                                : Icon(
                                    Icons.lock,
                                    color: AppSettings.white,
                                    size: 12,
                                  )),
                      ))
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    shortString(group.name, 14, true),
                    style: TextStyle(
                      // color: AppSettings.darkBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    shortString(group.description, 35, true),
                    style: TextStyle(
                      // color: AppSettings.darkBlue.withBrightNess(50),
                      fontSize: 11.0,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  formatDateTime(group.createdAt),
                  style: TextStyle(
                    // color: AppSettings.darkBlue.withBrightNess(30),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  group.members == 1
                      ? "1 member"
                      : "${group.members.toString()} members",
                  style: const TextStyle(
                    // color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
