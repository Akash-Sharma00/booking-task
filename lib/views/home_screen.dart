import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:second_app/contant.dart';
import 'package:second_app/controllers/home_controller.dart';
import 'package:second_app/utils/pallate.dart';
import 'package:second_app/views/booking.dart';
import 'package:second_app/views/second_screen.dart';
import 'package:second_app/widgets/my_button_button.dart';
import 'package:second_app/widgets/table_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Pallate.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
              onPressed: () {
                Get.to(() => const Bookings());
              },
              child: Text(
                "Bookings",
                style: TextStyle(color: Pallate.white),
              ))
        ],
        title: Text(
          "Reserve Seat",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AssetConst.homeImage),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              "Chooce Table",
              style: TextStyle(color: Pallate.white, fontSize: 20.sp),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 13, mainAxisSpacing: 17),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return TableWidget(controller: controller, index: index);
              },
            ),
          ),
          Obx(
            () => Padding(
              padding: EdgeInsets.all(20.w),
              child: Text(
                "Amount: ${controller.price.value} Rs",
                style: TextStyle(fontSize: 18.sp, color: Pallate.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: MyElevated(
              text: "Next",
              onPressed: () {
                Get.to(() => const SecondScreen());
              },
            ),
          )
        ],
      ),
    );
  }
}
