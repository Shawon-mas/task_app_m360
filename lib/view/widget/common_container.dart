import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/colors.dart';
class CommonContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Widget widget;
  const CommonContainer({Key? key, required this.width, required this.height, required this.color, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width,
      width: height,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10)
      ),
      child: widget,

    );
  }
}
