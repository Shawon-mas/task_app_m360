
import 'package:flutter/material.dart';
import 'package:task_app_m360/view/widget/video_player_widget.dart';

import 'package:video_player/video_player.dart';

import '../../main.dart';


class NetworkPlayerWidget extends StatefulWidget {
  late final String url;
  NetworkPlayerWidget({required this.url});
  @override
  _NetworkPlayerWidgetState createState() => _NetworkPlayerWidgetState();
}

class _NetworkPlayerWidgetState extends State<NetworkPlayerWidget> {
 // final textController = TextEditingController(text: urlLandscapeVideo);
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.network(widget.url)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.pause());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
    alignment: Alignment.center,
    child: Column(
      children: [
        VideoPlayerWidget(controller: controller),
      ],
    ),
  );

}
