import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_issues/Components/app_loader.dart';
import 'package:flutter_issues/Module/SplashScreen/Cubit/splash_screen_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocBuilder<SplashScreenCubit, dynamic>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: FlutterLogo(
                  size: height * .3,
                  curve: Curves.linearToEaseOut,
                  style: FlutterLogoStyle.horizontal,
                  duration: const Duration(seconds: 4),
                ),
              ),
              loader(context: context),
            ],
          );
        },
      ),
    );
  }
}
