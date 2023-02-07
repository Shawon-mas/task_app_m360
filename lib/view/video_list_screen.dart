import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app_m360/view/widget/circular_container_widget.dart';

import 'package:task_app_m360/view/widget/text_widget.dart';
import 'package:task_app_m360/view/widget/video_widget.dart';
import 'package:video_player/video_player.dart';

import '../controller/video_controller.dart';

import '../model/video_response_model.dart';
import '../utilites/colors.dart';

class VideoListScreen extends StatelessWidget {
  final _controller = Get.put(VideoListController());

  VideoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  print('Length ${_controller.videos.length}');
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircularContainer(
                      iconData: Icons.camera_alt_outlined,
                    ),
                    TextWidget(
                      value: 'Explore',
                      size: 20.sp,
                      fontWeight: FontWeight.bold,
                      textColor: MyColors.titleFontColor,
                    ),
                    CircularContainer(
                      iconData: Icons.notifications_active_outlined,
                    ),
                  ],
                ),
              ),
            ),

             Expanded(
              child: Obx(()=>
                 _controller.isVideoLoading.value
                     ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: _controller.videos.length,
                      itemBuilder: (context,index) {
                        //  List<Datum?> getAllVideo = _controller.videos;
                        //   List<VideoListModel> getAllVideo = _controller.videos as List<VideoListModel>;
                        //   List<VideoModel> videos =_controller.videos;
                        VideoData video=_controller.videos[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: MyColors.commonContainerColor,
                                borderRadius: BorderRadius.circular(20)
                            ),
                          //  height: 300.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  value: video.caption.toString(),
                                  size: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  textColor: MyColors.titleFontColor,
                                ),
                                TextWidget(
                                  value: video.createdAt.toString(),
                                  size: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  textColor: MyColors.secondaryFontColor,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: NetworkPlayerWidget(
                                     url: video.videoUrl.toString(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                     :Center(child: CircularProgressIndicator(),)
              )


            )
          ],
        ),
      ),
    );
  }
}
/*  FutureBuilder<VideosResponse>(
              future: _controller.fetchVideos(),
                builder: (context, snap) {
              if (snap.hasData) {
                return Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snap.data!.data!.length,
                        itemBuilder: (context, index) {
                          Video video = snap.data!.data![index];

                          return Column(
                            children: [

                              TextWidget(
                                value: video.caption!,
                                size: 20.sp,
                                fontWeight: FontWeight.bold,
                                textColor: MyColors.titleFontColor,
                              )
                            ],
                          );
                        }));
              } else {}
              return CircularProgressIndicator();
            })*/