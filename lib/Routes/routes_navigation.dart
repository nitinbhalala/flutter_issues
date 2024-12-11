import 'package:flutter_issues/Module/View/comment_view.dart';
import 'package:flutter_issues/Module/View/home_screen.dart';
import 'package:flutter_issues/Module/SplashScreen/splash_screen.dart';
import 'package:flutter_issues/Routes/routes_name.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RoutesNavigation {
  static final routes = [
    GetPage(
      name: RoutesName.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RoutesName.homeScreen,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: RoutesName.commentView,
      page: () => const CommentView(),
    ),
  ];
}
