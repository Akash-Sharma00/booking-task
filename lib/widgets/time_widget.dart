import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_app/controllers/second_cntroller.dart';
import 'package:second_app/utils/pallate.dart';

class TimeWidget extends StatelessWidget {
  final SecondController controller;
  const TimeWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (c, timeState) {
      return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white)),
          child: GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 0.02.sw,
                  mainAxisSpacing: 0.02.sw,
                  crossAxisCount: 4,
                  childAspectRatio: 1.6),
              itemBuilder: (c, i) {
                return InkWell(
                  onTap: () {
                    controller.timeIndex = i;
                    timeState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: controller.timeIndex == i
                            ? Pallate.eD702D
                            : Colors.black,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white)),
                    child: Text(
                      controller.timeList[i],
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 0.045.sw,
                          color: Colors.white),
                    ),
                  ),
                );
              }));
    });
  }
}
