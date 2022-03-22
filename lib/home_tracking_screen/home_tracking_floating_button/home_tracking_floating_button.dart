import 'package:check_location/home_tracking_screen/home_tracking_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTrackingFloatingButton extends StatelessWidget {
  const HomeTrackingFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<HomeTrackingController>(
      builder: (c) {
        final trackingStatus = c.trackingStatus.value;

        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (trackingStatus == TrackingStatus.stop)
              FloatingActionButton(
                onPressed: HomeTrackingController.to.startTracking,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text("start"),
                    Icon(Icons.play_arrow, size: 10),
                  ],
                ),
                heroTag: "start",
              ),
            if (trackingStatus == TrackingStatus.tracking)
              FloatingActionButton(
                onPressed: HomeTrackingController.to.pauseTracking,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text("pause"),
                    Icon(Icons.pause, size: 10),
                  ],
                ),
                heroTag: "pause",
              ),
            if (trackingStatus == TrackingStatus.paused) ...[
              FloatingActionButton(
                onPressed: HomeTrackingController.to.resumeTracking,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text("resume"),
                    Icon(Icons.play_circle_outline, size: 10),
                  ],
                ),
                heroTag: "resume",
              ),
              const SizedBox(height: 16.0),
            ],
            if (trackingStatus == TrackingStatus.paused)
              FloatingActionButton(
                onPressed: HomeTrackingController.to.stopTracking,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text("stop"),
                    Icon(Icons.stop, size: 10),
                  ],
                ),
                heroTag: "stop",
              ),
          ],
        );
      },
    );
  }
}
