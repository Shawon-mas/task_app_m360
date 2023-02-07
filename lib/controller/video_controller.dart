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

   Future _getAllVideo() async{
     var response = await generalGet(url: ApiServices.baseUrl);
     if(response!=null){
       VideoResponse videoResponse = VideoResponse.fromJson(json.decode(response.body));
       videos.value=videoResponse.data!;
       isVideoLoading.value = true;
       print(videoResponse);
     }
     isVideoLoading.value = true;

  }



  @override
  void onInit() {
    // TODO: implement onInit
    _getAllVideo();
 //  videoPlayer();
  //  fetchVideos();
    super.onInit();

  }



}