
class VideoData {
  int? id;
  String? caption;
  String?  videoUrl;
  DateTime?  createdAt;

  VideoData({this.id, this.caption, this.videoUrl, this.createdAt});

  VideoData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caption = json['caption'];
    videoUrl = json['video_url'];
    createdAt = DateTime.parse(json['created_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['caption'] = this.caption;
    data['video_url'] = this.videoUrl;
    data['created_at'] = this.createdAt!.toIso8601String();
    return data;
  }
}

class VideoResponse {
  bool?  success;
  List<VideoData>?  data;

  VideoResponse({this.success, this.data});

  VideoResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <VideoData>[];
      json['data'].forEach((v) {
        data!.add(VideoData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



/*class Video {
  int? id;
  String? caption;
  String? videoUrl;
  DateTime? createdAt;

  Video({this.id, this.caption, this.videoUrl, this.createdAt});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'],
      caption: json['caption'],
      videoUrl: json['video_url'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}

class VideosResponse {
  bool? success;
  List<Video>? data;

  VideosResponse({this.success, this.data});

  factory VideosResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Video> dataList = list.map((i) => Video.fromJson(i)).toList();

    return VideosResponse(
      success: json['success'],
      data: dataList,
    );
  }
}*/
