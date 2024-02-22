// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

import '../constants/color.dart';
import '../constants/icons.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({
    Key? key,
    required this.callback,
  }) : super(key: key);

  final Function(VideoPlayerController controller) callback;

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;
  Widget? controls;

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    initializeVideo();
  }

  void initializeVideo() {
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      })
      ..addListener(() {
        if (_controller.value.isPlaying) {
          controls = GestureDetector(
            onTap: () {
              if (mounted) {
                setState(() {
                  _controller.pause();
                });
                widget.callback(_controller);
              }
            },
            child: Image.asset(
              icPause,
              height: 50,
            ),
          );
        } else if (_controller.value.position.inMilliseconds -
                _controller.value.duration.inMilliseconds <
            1) {
          if (mounted) {
            setState(() {
              controls = GestureDetector(
                onTap: () {
                  setState(() {
                    _controller.play();
                  });
                  widget.callback(_controller);
                },
                child: Image.asset(
                  icLearning,
                  height: 50,
                ),
              );
            });
          }
        } else {
          controls = GestureDetector(
            onTap: () {
              if (mounted) {
                setState(() {
                  _controller.play();
                });
              }
              widget.callback(_controller);
            },
            child: Image.asset(
              icLearning,
              height: 50,
            ),
          );
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Status: ${_controller.value.isInitialized}");

    return controls == null
        ? SizedBox(
            height: 20.h,
            width: 100.w,
            child: const Center(child: CircularProgressIndicator()))
        : !_controller.value.isInitialized
            ? SizedBox(
                height: 20.h,
                width: 100.w,
                child: Stack(
                  children: [
                    Center(
                        child: Text("${_controller.value.errorDescription}")),
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            controls = null;
                          });
                          initializeVideo();
                        },
                        child: Icon(
                          Icons.sync,
                          size: 60,
                          color: baseBlue,
                        ),
                      ),
                    )
                  ],
                ))
            : AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  children: [
                    VideoPlayer(
                      _controller,
                    ),
                    Positioned.fill(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [controls ?? Container()],
                      ),
                    )
                  ],
                ),
              );
  }
}
