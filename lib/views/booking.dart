import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:second_app/booking_model.dart';
import 'package:second_app/contant.dart';
import 'package:second_app/controllers/second_cntroller.dart';
import 'package:second_app/utils/pallate.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  late SecondController controller = Get.put(SecondController());
  @override
  void initState() {
    controller.getBooking();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallate.bgColor,
      appBar: AppBar(
        title: const Text("Bookings"),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.bookis.length,
          itemBuilder: (BuildContext context, int index) {
            BookkingModel data = controller.bookis[index];
            return SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        AssetConst.table,
                        color: Pallate.white,
                        height: 50,
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price : ${data.price}",
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 227, 186, 186),
                                  fontSize: 15.sp),
                            ),
                            Text(
                              "Time : ${data.time}",
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 228, 179, 102),
                                  fontSize: 18.sp),
                            ),
                            Text(
                              "Month : ${data.date}",
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 182, 206, 93),
                                  fontSize: 18.sp),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
