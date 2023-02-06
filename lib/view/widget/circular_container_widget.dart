import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/colors.dart';
class CircularContainer extends StatelessWidget {
  final IconData iconData;

  CircularContainer({Key? key, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 50.w,
      decoration: BoxDecoration(
          color: MyColors.circularContainerColor,
          borderRadius: BorderRadius.circular(100)
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Icon(iconData,color: Colors.black,),
      ),
    );
  }
}
