import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:check_location/tracking_list_screen/tracking_list_screen_controller.dart';

class TrackingListScreen extends StatelessWidget {
  const TrackingListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TrackingListScreenController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("Tracking List"),
        ),
        body: GetX<TrackingListScreenController>(
          builder: (c) {
            final activities = c.data.value;

            return ListView.separated(
              itemBuilder: (_, index) {
                final activity = activities[index];
                final startDataTime = activity.startTime ?? 0;
                final endDataTime = activity.endTime ?? 0;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "From ${DateTime.fromMillisecondsSinceEpoch(startDataTime)}\nto ${DateTime.fromMillisecondsSinceEpoch(endDataTime)}",
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Max elevation: ${activity.maxElevation?.toStringAsFixed(5)}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(width: 24.0),
                          Expanded(
                            child: Text(
                              "Ascend: ${activity.ascend?.toStringAsFixed(5)}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Tracking count: ${activity.trackCount}",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (_, __) => Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                height: 1.0,
                width: double.infinity,
                color: Colors.grey,
              ),
              itemCount: activities.length,
            );
          },
        ),
      ),
    );
  }
}
