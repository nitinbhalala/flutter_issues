import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_issues/Components/app_loader.dart';
import 'package:sizer_pro/sizer.dart';

Widget networkImageLoader({
  height,
  BoxFit? fit,
  double? width,
  Color? loaderColor,
  required String url,
  Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder,
}) {
  return CachedNetworkImage(
    fadeInCurve: Curves.ease,
    imageUrl: url.isNotEmpty ? url : "",
    alignment: Alignment.center,
    width: width,
    height: height,
    fit: fit ?? BoxFit.cover,
    filterQuality: FilterQuality.high,
    imageBuilder: imageBuilder,
    placeholder: (context, url) => loader(context: context),
    errorWidget: (context, url, error) {
      if (url.isEmpty) {
        return const Center(
          child: Icon(Icons.error),
        );
      } else {
        return SizedBox(
          width: 17.w,
          child: const Center(child: Icon(Icons.image)),
        );
      }
    },
  );
}
