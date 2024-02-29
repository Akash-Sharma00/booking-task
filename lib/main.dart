import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:second_app/firebase_options.dart';
import 'package:second_app/utils/globals.dart';
import 'package:second_app/views/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initControllers();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, _) {
          return const GetMaterialApp(
            title: 'Material App',
            home: HomeScreen(),
          );
        });
  }
}
