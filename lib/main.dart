import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_issues/Routes/routes_name.dart';
import 'package:flutter_issues/Routes/routes_navigation.dart';
import 'package:flutter_issues/Services/Api/api_services.dart';
import 'package:flutter_issues/Services/bloc_services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:sizer_pro/sizer.dart';

Dio dio = Dio();
ApiService apiService = ApiService();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: providers,
          child: GetMaterialApp(
            title: 'Flutter Issues',
            initialRoute: RoutesName.splashScreen,
            debugShowCheckedModeBanner: false,
            getPages: RoutesNavigation.routes,
          ),
        );
      },
    );
  }
}
