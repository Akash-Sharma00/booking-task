
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:second_app/booking_model.dart';

class ConnectToFire {
  final booking = FirebaseFirestore.instance.collection('booking');

  Future<void> saveData(String time, String date, String price) async {
    final chatInGlobal = {
      'time': time,
      'date': date,
      "price": price,
      'createdAt': DateTime.now(),
    };
    await booking.doc().set(chatInGlobal);
    return;
  }

  Future<List<BookkingModel>> getEvetnts() async {
    List<BookkingModel> modelList = [];
    var querySnapshot = await booking.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      print("1212 ${data.keys}");
      modelList.add(BookkingModel(
          date: data['date'] ?? "Date",
          price: data['price'] ?? "",
          time: data['time'] ?? "Task"));
    }
    return modelList;
  }
}
