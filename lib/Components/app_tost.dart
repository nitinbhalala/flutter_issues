import 'package:sizer_pro/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

Future<ToastFuture> successToast({
  String? title,
  required BuildContext context,
}) async {
  return showToast(
    title,
    fullWidth: true,
    context: context,
    isHideKeyboard: true,
    textAlign: TextAlign.center,
    backgroundColor: Colors.green,
    animation: StyledToastAnimation.fade,
    duration: const Duration(seconds: 3),
    reverseCurve: Curves.easeInOutCubicEmphasized,
    animDuration: const Duration(milliseconds: 900),
    shapeBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.h),
    ),
  );
}

Future<ToastFuture> errorTost({
  String? title,
  Color? backgroundColor,
  required BuildContext context,
}) async {
  return showToast(
    title,
    fullWidth: true,
    context: context,
    isHideKeyboard: true,
    textAlign: TextAlign.center,
    duration: const Duration(seconds: 4),
    animation: StyledToastAnimation.slideFromTop,
    reverseCurve: Curves.easeInOutCubicEmphasized,
    animDuration: const Duration(milliseconds: 900),
    backgroundColor: Theme.of(context).colorScheme.error,
    shapeBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.h),
    ),
  );
}
