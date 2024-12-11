import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

shimmerLoaderWidget(
  context, {
  required dynamic child,
}) {
  return Shimmer.fromColors(
    child: child,
    enabled: true,
    highlightColor: Colors.grey.shade50,
    baseColor: Colors.red.withOpacity(0.2),
  );
}
