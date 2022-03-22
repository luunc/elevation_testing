import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:check_location/home_tracking_screen/home_tracking_controller.dart';
import 'package:check_location/home_tracking_screen/home_tracking_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Elevation checking',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GetBuilder<HomeTrackingController>(
        init: HomeTrackingController(),
        builder: (_) => const HomeTrackingScreen(),
      ),
    );
  }
}
