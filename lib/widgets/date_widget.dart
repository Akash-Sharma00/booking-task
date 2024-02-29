import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:second_app/controllers/second_cntroller.dart';
import 'package:second_app/utils/pallate.dart';

class DateWidget extends StatelessWidget {
  final SecondController controller;
  const DateWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, state) {
      DateTime monthStartDate = DateTime(2024, controller.monthIndex + 1, 1);
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Pallate.eD702D)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Date",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const Spacer(),
                Obx(
                  () => Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: Pallate.eD702D, width: 1),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: DropdownButton<String>(
                      underline: const SizedBox.shrink(),
                      icon: Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Pallate.white,
                      ),
                      dropdownColor: Pallate.bgColor,
                      items: controller.months.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Pallate.white),
                          ),
                        );
                      }).toList(),
                      value: controller.monthSelected.value,
                      style: TextStyle(
                          color: Pallate.black, //<-- SEE HERE
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      onChanged: (val) {
                        controller.monthSelected.value = val!;
                        controller.monthIndex = controller.months
                            .indexOf(controller.monthSelected.value);
                      },
                    ),
                  ),
                )
              ],
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      DateTime(2024, monthStartDate.month + 1, 0).day, (index) {
                    String dayAbbreviation = DateFormat.E().format(
                        monthStartDate.add(Duration(
                            days:
                                index))); // Get day abbreviation (e.g., "Fri")
                    String dayOfMonth = DateFormat.d().format(
                        monthStartDate.add(Duration(
                            days: index))); // Get day of the month (e.g., "03")

                    String dayday = "$dayAbbreviation\n$dayOfMonth";
                    return InkWell(
                      onTap: () {
                        controller.dateIndex = index;
                        state(() {});
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                          color: controller.dateIndex == index
                              ? Pallate.eD702D
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 18),
                          child: Text(
                            dayday,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }),
                ))
          ],
        ),
      );
    });
  }
}
