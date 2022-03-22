import 'package:check_location/home_tracking_screen/home_tracking_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTrackingBody extends StatelessWidget {
  const HomeTrackingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX<HomeTrackingController>(
        builder: (c) {
          final locations = c.elevationData;
          final locationLength = locations.length;
          final maxEle = c.maxElevation.value;
          final ascend = c.ascend.value;

          return Row(
            children: [
              Expanded(
                flex: 2,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0,
                  ),
                  itemBuilder: (_, index) {
                    final location = locations[index];

                    final time = location.time == null
                        ? DateTime.now()
                        : DateTime.fromMillisecondsSinceEpoch(
                            location.time!.toInt(),
                          );

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("no. ${locationLength - index}"),
                        Text("time: $time"),
                        Text(
                            "altitude: ${location.altitude?.toStringAsFixed(5)}"),
                      ],
                    );
                  },
                  separatorBuilder: (_, __) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    height: 1.0,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                  itemCount: locations.length,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Max Elevation:\n${maxEle.toStringAsFixed(5)}"),
                    Text("Ascend:\n${ascend.toStringAsFixed(5)}"),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
