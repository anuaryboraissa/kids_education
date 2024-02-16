import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

import '../constants/color.dart';
import '../constants/icons.dart';
import '../models/lesson.dart';
import '../widgets/custom_video_player.dart';
import '../widgets/lesson_card.dart';

class DetailsScreen extends StatefulWidget {
  final String title;
  const DetailsScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _selectedTag = 0;

  void changeTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

  String initialCategory = "Addition";
  VideoPlayerController? controller;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
           Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
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
                  height: 10,
                ),
                CustomVideoPlayer(
                  callback: (VideoPlayerController _controller) {
                    setState(() {
                      controller = _controller;
                    });
                    debugPrint("Assigned!");
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Arithmetic Operations",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  "Addition in real numbers",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Category"),
                    SizedBox(width: 20.w,),
                    Flexible(
                      child: DropdownButtonFormField(
                        
                        decoration: const InputDecoration.collapsed(hintText: ""),
                        value: initialCategory,
                        items: [
                          "Addition",
                          "Subtraction",
                          "Multiplication",
                          "Division"
                        ]
                            .map((e) => DropdownMenuItem(
                              alignment: Alignment.center,
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            initialCategory = value.toString();
                          });
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTabView(
                  index: _selectedTag,
                  changeTab: changeTab,
                ),
                _selectedTag == 0 ? const PlayList() : const Description(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlayList extends StatelessWidget {
  const PlayList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (_, __) {
          return const SizedBox(
            height: 20,
          );
        },
        padding: const EdgeInsets.only(top: 20, bottom: 40),
        shrinkWrap: true,
        itemCount: lessonList.length,
        itemBuilder: (_, index) {
          return LessonCard(lesson: lessonList[index]);
        },
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Flexible(
      child:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
              "Build Flutter iOS and Android Apps with a Single Codebase: Learn Google's Flutter Mobile Development Framework & Dart"),
        ),
      ),
    );
  }
}

class CustomTabView extends StatefulWidget {
  final Function(int) changeTab;
  final int index;
  const CustomTabView({Key? key, required this.changeTab, required this.index})
      : super(key: key);

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  final List<String> _tags = ["Playlist (22)", "Description"];

  Widget _buildTags(int index) {
    return GestureDetector(
      onTap: () {
        widget.changeTab(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 4.w, vertical: 15),
        decoration: BoxDecoration(
          color: widget.index == index ? baseBlue.withAlpha(250) : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          _tags[index],
          style: TextStyle(
            color: widget.index != index ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _tags
            .asMap()
            .entries
            .map((MapEntry map) => _buildTags(map.key))
            .toList(),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final Color? color;
  final VoidCallback onTap;

  const CustomIconButton({
    Key? key,
    required this.child,
    required this.height,
    required this.width,
    this.color = Colors.white,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        child: Center(child: child),
        onTap: onTap,
      ),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 2.0,
            spreadRadius: .05,
          ), //BoxShadow
        ],
      ),
    );
  }
}
