import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mathgame/src/dashboard/widgets/custom_back_button.dart';

import '../constants/color.dart';
import '../widgets/chat_ui.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController editSmsCtrl = TextEditingController();
  late ScrollController _scrollController;
  void bottomScroll() {
    final bottomOffset = _scrollController.position.minScrollExtent;
    _scrollController.animateTo(bottomOffset,
        duration: const Duration(microseconds: 1000), curve: Curves.easeInOut);
  }

  String inputText = "";
  bool _enableEdit = true;
  List<Map<String, dynamic>> msgs = [];

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              // color: AppSettings.baseBlue.withAlpha(250),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(parentContext: context),
                  Flexible(
                    child: ListTile(
                      onTap: () {
                        debugPrint("View group Info =========> !");
                      },
                      leading: CircleAvatar(),
                      title: Text("Group Name"),
                      subtitle: Text("Members"),
                      trailing: PopupMenuButton(
                        onSelected: (value) {},
                        position: PopupMenuPosition.under,
                        itemBuilder: (context) => ["clear", "view"]
                            .map((e) => PopupMenuItem(child: Text(e)))
                            .toList(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: msgs.length,
                    reverse: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ChatUi(
                        message: msgs[index],
                        isMe: (msgs[index]['type'] as bool),
                      );
                    })),
            Container(
              height: 55.0,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2.0, color: AppSettings.darkBlue.withAlpha(15))),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 10.0),
                    child: TextField(
                      focusNode: focusNode,
                      onTap: () {
                        setState(() {
                          shoemoji = false;
                          focusNode.requestFocus();
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Messages...",
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                                top: 0, left: 5, right: 5),
                            child: GestureDetector(
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      shoemoji = true;
                                      focusNode.unfocus();
                                      focusNode.canRequestFocus = false;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.emoji_emotions,
                                  )),
                            )),
                      ),
                      controller: editSmsCtrl,
                      keyboardType: TextInputType.text,
                      // enabled: _enableEdit,
                      onSubmitted: (String str) async {
                        // _enableEdit = false;
                        // inputText = str;
                        // final MessageData? res =
                        //     await widget.ctrl.sendMessage(inputText);
                        // if (res != null) {
                        //   setState(() {
                        //     widget.ctrl.overviewList.insert(0, res);
                        //     inputText = "";
                        //     editSmsCtrl.clear();
                        //   });
                        // }
                        // _enableEdit = true;
                      },
                      onChanged: (String str) {
                        setState(() {
                          inputText = str;
                        });
                      },
                    ),
                  )),
                  GestureDetector(
                      onTap: inputText.isEmpty
                          ? null
                          : () {
                              String time = DateFormat('yyyy-MM-dd HH:mm:ss')
                                  .format(DateTime.now());
                              Map<String, dynamic> mySms = {
                                "msg": editSmsCtrl.text,
                                "time": time,
                                "type": Random().nextInt(10) % 2 == 0
                              };
                              setState(() {
                                msgs.insert(0, mySms);

                                // isLoaded = false;
                              });
                              bottomScroll();
                              // chatProvider.updateConversation();
                              editSmsCtrl.clear();
                              setState(() {
                                _enableEdit = false;
                                inputText = "";
                                focusNode.requestFocus();
                                // isLoaded = false;
                              });
                            },
                      child: sendIcon(context))
                ],
              ),
            ),
            // shoemoji ? emojiPicker() : Container()
          ],
        ),
      ),
    );
  }

  bool shoemoji = false;
  FocusNode focusNode = FocusNode();
  // Widget emojiPicker() {
  //   return SizedBox(
  //     height: 250,
  //     width: MediaQuery.of(context).size.width,
  //     child: EmojiPicker(
  //       textEditingController: editSmsCtrl,
  //       onBackspacePressed: () {},
  //       onEmojiSelected: (emoji, category) {
  //         // setState(() {
  //         //   shoemoji = false;
  //         //   focusNode.requestFocus();
  //         // });
  //         // print(emoji);
  //       },
  //     ),
  //   );
  // }

  Padding sendIcon(BuildContext context, [int alpha = 255]) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        Icons.send,
        size: 35.0,
        color: AppSettings.darkBlue.withAlpha(alpha),
      ),
    );
  }
}
