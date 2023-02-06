

import 'package:http/http.dart' as http;



Future<http.Response?> generalGet({required String url}) async {
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return response;
  } else {
    return null;
  }
}
/*

Future<VideoListModel> fetchVideos() async {
  var response = await generalGet(url: ApiServices.baseUrl);

  if (response!.statusCode == 200) {
    return VideoListModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load videos');
  }
}*/
/*
Future<VideosResponse> fetchVideos() async {
  var response = await generalGet(url: ApiServices.baseUrl);

  if (response!.statusCode == 200) {
    print(json.decode(response.body));
    return VideosResponse.fromJson(json.decode(response.body));

  } else {
    throw Exception('Failed to load videos');
  }
}*/
