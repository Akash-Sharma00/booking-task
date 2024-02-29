

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:second_app/contant.dart';
import 'package:second_app/controllers/home_controller.dart';
import 'package:second_app/utils/pallate.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({
    super.key,
    required this.controller, required this.index,
  });

  final HomeController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> GestureDetector(
        onTap: () {
          controller.index.value = index;
          controller.price.value = (index + 1) * 100;
        },
        child: Container(
          height: 100.w,
          width: 100.w,
          padding: EdgeInsets.symmetric(vertical: 5.h),
          decoration: BoxDecoration(
              color: controller.index.value == index
                  ? Pallate.eD702D
                  : Pallate.d79F81,
              border: controller.index.value == index
                  ? Border.all(color: Pallate.white, width: 2)
                  : null,
              borderRadius: BorderRadius.circular(20.r)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AssetConst.table,
                height: 56.h,
                width: 58.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AssetConst.persons),
                  Text(
                    " ${index + 1}",
                    style: TextStyle(fontSize: 24.sp),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
