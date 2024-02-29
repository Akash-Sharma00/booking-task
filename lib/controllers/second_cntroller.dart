import 'package:get/get.dart';
import 'package:second_app/booking_model.dart';
import 'package:second_app/utils/connect_to_fire.dart';

class SecondController extends GetxController {
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  int timeIndex = 0;
  List<String> timeList = [
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30'
  ];

  int monthIndex = 0;
  bool expanded = false;
  int dateIndex = 0;
  RxString monthSelected = "Jan".obs;

  RxList<BookkingModel> bookis = <BookkingModel>[].obs;

  getBooking() async {
    bookis.value = await ConnectToFire().getEvetnts();
  }
}
