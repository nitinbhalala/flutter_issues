import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

Widget loader({
  Color? color,
  double? strokeWidth,
  required BuildContext context,
}) {
  return Center(
    child: CircularProgressIndicator.adaptive(
      strokeWidth: strokeWidth ?? 0.5.w,
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
    ),
  );
}
