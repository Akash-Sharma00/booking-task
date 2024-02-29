import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_app/utils/pallate.dart';

class MyElevated extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  const MyElevated({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Pallate.eD702D,
        minimumSize: const Size(348, 56.96),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.r),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: Pallate.white),
      ),
    );
  }
}
