import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:supercharged/supercharged.dart';

Widget textShimmer({double width = 140.0, double height = 20.0}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey,
    highlightColor: Colors.white,
    child: Container(
      height: height,
      width: width,
      color: Colors.grey[300],
    ),
  );
}

Widget roundedShimmer(
    {double width = double.infinity,
    double height = 50,
    Color baseColor = Colors.grey,
    Color highlightColor = Colors.white,
    double borderRadius = 15,
    Widget? child}) {
  return Shimmer.fromColors(
    baseColor: baseColor,
    highlightColor: highlightColor,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child ?? SizedBox(),
    ),
  );
}
