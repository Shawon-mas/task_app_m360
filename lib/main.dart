import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:task_app_m360/view/video_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: false,
        useInheritedMediaQuery: false,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: VideoListScreen(),
          );
        });
  }
}
