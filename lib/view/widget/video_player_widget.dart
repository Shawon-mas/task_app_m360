import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app_m360/view/widget/text_widget.dart';
import 'package:video_player/video_player.dart';

import '../../utilites/colors.dart';

class VideoPlayerWidget extends StatefulWidget {
  final VideoPlayerController controller;

  VideoPlayerWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  bool isMusicOn = true;

  void soundToggle() {
    setState(() {
      isMusicOn == false
          ? widget.controller.setVolume(0.0)
          : widget.controller.setVolume(1.0);
      isMusicOn = !isMusicOn;
    });
  }

  @override
  Widget build(BuildContext context) =>
      widget.controller != null && widget.controller.value.isInitialized
          ? Container(alignment: Alignment.topCenter, child: buildVideo())
          : Container(
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            );

  Widget buildVideo() => InkWell(
        onTap: () {
          setState(() {
            widget.controller.value.isPlaying
                ? widget.controller.pause()
                : widget.controller.play();
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            buildVideoPlayer(),
            Center(
              child: Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  color: MyColors.circularContainerColor,

                ),
                child: Icon(
                  widget.controller.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow,
                  size: 30,
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                           Row(
                             children: [
                               Icon(Icons.comment),
                               TextWidget(
                                 value: '10',
                                 size: 12.sp,
                                 fontWeight: FontWeight.bold,
                                 textColor: MyColors.titleFontColor,
                               ),
                               Icon(Icons.favorite_border),
                               TextWidget(
                                 value: '122',
                                 size: 12.sp,
                                 fontWeight: FontWeight.bold,
                                 textColor: MyColors.titleFontColor,
                               ),

                             ],
                           ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(Icons.send),

                            Icon(Icons.bookmark_add),

                          ],
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white60,
                            Colors.white60,

                          ])),
                )
            )


            //  Positioned.fill(child: BasicOverlayWidget(controller: controller)),
          ],
        ),
      );

  Widget buildVideoPlayer() => AspectRatio(
        aspectRatio: widget.controller.value.aspectRatio,
        child: VideoPlayer(widget.controller),
      );
}
