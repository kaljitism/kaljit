import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class CodeProvider extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String main = "";

  void fetchCode() {
    db.collection("main").get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          main =  '${docSnapshot.data()['main.dart']}';
          notifyListeners();
        }
      },
    );
  }
}
