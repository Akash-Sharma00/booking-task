import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:second_app/contant.dart';
import 'package:second_app/controllers/home_controller.dart';
import 'package:second_app/controllers/second_cntroller.dart';
import 'package:second_app/utils/connect_to_fire.dart';
import 'package:second_app/utils/pallate.dart';
import 'package:second_app/views/booking.dart';
import 'package:second_app/widgets/date_widget.dart';
import 'package:second_app/widgets/time_widget.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SecondController controller = Get.put(SecondController());

    return Scaffold(
      backgroundColor: Pallate.bgColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Pallate.white,
            )),
        backgroundColor: Colors.transparent,
        title: const Text(
          "Reserve Seat",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AssetConst.bookImage),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              "Select Time",
              style: TextStyle(fontSize: 21.sp, color: Pallate.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: TimeWidget(
              controller: controller,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: DateWidget(controller: controller),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 50.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                        color: Pallate.white,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Cancel"),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.close,
                          color: Pallate.black,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await ConnectToFire().saveData(
                        controller.timeList[controller.timeIndex],
                        controller.months[controller.monthIndex],
                        Get.find<HomeController>().price.toString());

                    Get.off(() => const Bookings());
                  },
                  child: Container(
                    height: 50.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                      color: Pallate.eD702D,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Confirm"),
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            AssetConst.table,
                            height: 20,
                            width: 20,
                            color: Pallate.white,
                          ),
                        ]),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
