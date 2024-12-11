import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_issues/Module/View/home_screen.dart';
import 'package:get/get.dart';

class SplashScreenCubit extends Cubit<dynamic> {
  SplashScreenCubit() : super(0) {
    (
      Future.delayed(const Duration(seconds: 4), () async {
        Get.offAll(() => const HomeScreen());
      }),
    );
  }
}
