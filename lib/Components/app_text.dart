import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer_pro/sizer.dart';

Widget appText({
  TextStyle? style,
  String? title,
  FontWeight? fontWeight,
  decoration,
  double? fontSize,
  double? letterSpacing,
  FontStyle? fontStyle,
  Color? color,
  TextAlign? textAlign,
  int? maxLines,
  double? height,
  String? fontFamily,
  TextOverflow? textOverflow,
  required BuildContext context,
}) {
  return Text(
    title ?? '',
    maxLines: maxLines,
    textAlign: textAlign ?? TextAlign.start,
    overflow: textOverflow ?? TextOverflow.ellipsis,
    style: GoogleFonts.inter(
      color: color,
      height: height,
      fontStyle: fontStyle,
      fontSize: fontSize ?? 3.h,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight ?? FontWeight.w600,
      decoration: decoration ?? TextDecoration.none,
    ),
  );
}
