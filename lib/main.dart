import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_app/database/datebase_controller.dart';
import 'package:teaching_app/pages/add_content_planning/content_planning_screen.dart';
import 'package:teaching_app/pages/dashboard_content/dashboard_screen.dart';
import 'package:teaching_app/pages/video_main_screen/video_main_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Teaching App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<MyDataController>(() => MyDataController());
      }),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const DashboardScreen()),
        GetPage(name: '/contentPlanning', page: () => const ContentPlanningScreen()),
        GetPage(name: '/videoScreen', page: () => const VideoMainScreen()),
      ],
    );
  }
}
