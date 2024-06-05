import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travelmate/model/editModelclass.dart';

class editControlScreen with ChangeNotifier {
  var collectionReference = FirebaseFirestore.instance.collection("edit");
  List<EditModel> editList = [];
  Future addData(EditModel editModel) async {
    final data = {
      "name": editModel.name,
      "uname": editModel.uname,
      "bio": editModel.bio,
      "gender": editModel.gender
    };

    await collectionReference.add(data);
  }

  addEventListner() {
    collectionReference.snapshots().listen((event) {
      editList = event.docs.map((e) {
        return EditModel(
          name: e.data()["name"],
          uname: e.data()["uname"],
          bio: e.data()["bio"],
          gender: e.data()["gender"],
        );
      }).toList();
      notifyListeners();
    });
  }
}
