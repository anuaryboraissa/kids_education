// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../main.dart';
import 'center_content_widget.dart';

final noBackground = Container();
final defaultBackground = Container(
  decoration: BoxDecoration(
      gradient: LinearGradient(
          colors: [
            Colors.blue[600]!,
            Colors.blue[400]!,
            Colors.blue[600]!,
          ]
      )
  ),
);
final background2Colors = Container(
  decoration: const BoxDecoration(
      gradient: LinearGradient(
          colors: [
            Color(0xff4984f2),
            Color(0xff87b3ff),
          ]
      )
  ),
);

class MyScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? background;
  final EdgeInsets padding;

  const MyScaffold({
    Key? key,
    this.appBar,
    required this.body,
    this.floatingActionButton,
    this.background,
     this.padding= const EdgeInsets.symmetric(horizontal: kMargin, vertical: kMargin),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(child: background ?? defaultBackground),
        Scaffold(
          appBar: appBar,
          backgroundColor: Colors.transparent,
          body: CenterContentWidget(
            child: Padding(
              padding: padding,
              child: body,
            ),
          ),
          floatingActionButton: floatingActionButton,
        ),
      ],
    );
  }
}
