import 'package:flutter_issues/Module/Screens/comment_view.dart';
import 'package:flutter_issues/Module/Screens/favorite_screen.dart';
import 'package:flutter_issues/Module/Screens/home_screen.dart';
import 'package:flutter_issues/Module/SplashScreen/splash_screen.dart';
import 'package:flutter_issues/Routes/routes_name.dart';
import 'package:get/get.dart';

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
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RoutesName.favoriteScreen,
      transition: Transition.rightToLeftWithFade,
      page: () => const FavoriteScreen(),
    ),
  ];
}
