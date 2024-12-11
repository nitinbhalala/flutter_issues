import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_issues/Module/CommentCubit/comment_cubit.dart';
import 'package:flutter_issues/Module/HomeCubit/home_cubit.dart';
import 'package:flutter_issues/Module/SplashScreen/Cubit/splash_screen_cubit.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  BlocProvider(create: (context) => SplashScreenCubit()),
  BlocProvider(create: (context) => HomeCubit()),
  BlocProvider(create: (context) => CommentCubit()),
];
