import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:check_location/tracking_list_screen/tracking_list_screen.dart';
import 'package:check_location/home_tracking_screen/home_tracking_body/home_tracking_body.dart';
import 'package:check_location/home_tracking_screen/home_tracking_floating_button/home_tracking_floating_button.dart';

class HomeTrackingScreen extends StatelessWidget {
  const HomeTrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tracking Elevation"),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => const TrackingListScreen()),
            icon: const Icon(Icons.list),
          ),
        ],
      ),
      floatingActionButton: const HomeTrackingFloatingButton(),
      body: const HomeTrackingBody(),
    );
  }
}
