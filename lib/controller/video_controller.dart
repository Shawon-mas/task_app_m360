import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

import '../model/video_response_model.dart';
import '../utilites/api_services.dart';

import 'package:flutter/material.dart';
import '../utilites/response_repository.dart';


class VideoListController extends GetxController{

  late VideoPlayerController videoPlayerController;
  RxList<VideoData> videos = RxList<VideoData>();
  var isVideoLoading = false.obs;
  var videoUrl=''.obs;
  var urlCache=''.obs ;

   Future getAllVideo() async{
     var response = await generalGet(url: ApiServices.baseUrl);
     if(response!=null){
       VideoResponse videoResponse = VideoResponse.fromJson(json.decode(response.body));
       videos.value=videoResponse.data!;
       for(var url in videos){
         videoUrl.value=url.videoUrl.toString();
         print(videoUrl.value);

       }
       SharedPreferences prefs = await SharedPreferences.getInstance();
       prefs.setString('video_url', videoUrl.toString());
       isVideoLoading.value = true;
       print(videoResponse);
     }
     isVideoLoading.value = true;

  }


/*  Future<VideosResponse> fetchVideos() async {
    var response = await generalGet(url: ApiServices.baseUrl);

    if (response!.statusCode == 200) {
      print(json.decode(response.body));
      return VideosResponse.fromJson(json.decode(response.body));

    } else {
      throw Exception('Failed to load videos');
    }
  }*/



/*  videoPlayer(){
    videoPlayerController = VideoPlayerController.network(videoUrl.toString())
      ..initialize().then((_) {
        videoPlayerController.play();
      });
  }*/


  @override
  void onInit() {
    // TODO: implement onInit
    getAllVideo();
 //  videoPlayer();
  //  fetchVideos();
    super.onInit();
    videoPlayerController = VideoPlayerController.network(videoUrl.toString())
      ..addListener(() =>  ((){}))
      ..setLooping(true)
    ..initialize().then((value) => videoPlayerController.pause());
  }
  @override
  void dispose() {
    // TODO: implement dispose
    videoPlayerController.dispose();
    super.dispose();
  }


}