// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../constants/color.dart';

class ChatUi extends StatefulWidget {
  const ChatUi({
    Key? key,
    required this.isMe,
    required this.message,
  }) : super(key: key);
  final bool isMe;
  final Map<String,dynamic> message;

  @override
  State<ChatUi> createState() => _ChatUiState();
}

class _ChatUiState extends State<ChatUi> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 2.0),
      child: Row(
        mainAxisAlignment:
            widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment:
            widget.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
//          SizedBox(
//            width: isme ? 30.0 : 20,
//          ),
          !widget.isMe
              ? Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: Theme.of(context).brightness==Brightness.dark?AppSettings.darkRed:AppSettings.primary.withBrightNess(-25),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.elliptical(15, 15))),
                )
              : Expanded(
                  child: Container(),
                ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            constraints: BoxConstraints.loose(
                Size.fromWidth(MediaQuery.of(context).size.width - 50.0)),
            decoration: BoxDecoration(
                color: widget.isMe
                    ? Theme.of(context).brightness==Brightness.dark?AppSettings.darkBlue: AppSettings.primary.withBrightNess(-55)
                    :Theme.of(context).brightness==Brightness.dark?AppSettings.darkRed: AppSettings.primary.withBrightNess(-20),
                borderRadius: BorderRadius.only(
                    topRight: const Radius.circular(15.0),
                    topLeft: widget.isMe ? const Radius.circular(15.0) : Radius.zero,
                    bottomRight:
                        !widget.isMe ? const Radius.circular(15.0) : Radius.zero,
                    bottomLeft: const Radius.circular(15.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Text(data.smsMessage.body.toString(),
                //     softWrap: true, overflow: TextOverflow.clip),
                Text(widget.message['msg'].toString(),
                    softWrap: true, overflow: TextOverflow.clip),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  widget.message['time'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12),
                )
              ],
            ),
          ),
          widget.isMe
              ? Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(
                      color:  Theme.of(context).brightness==Brightness.dark?AppSettings.darkBlue:AppSettings.primary.withBrightNess(-55),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.elliptical(15, 15))),
                )
              : Expanded(
                  child: Container(),
                ),
        ],
      ),
    );
  }
}