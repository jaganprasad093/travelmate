import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travelmate/model/eventModelclass.dart';

class eventsControllerScreen with ChangeNotifier {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("events");
  String selectedType = "solo";

  changeType(String value) {
    selectedType = value;
    notifyListeners();
  }

  Future addData(EventModel eventModel) async {
    final data = {
      "destination": eventModel.destination,
      "date": eventModel.date,
      "budget_of_trip": eventModel.budget_of_trip,
      "choose_your_interset": eventModel.choose_your_interset,
      "trip_name": eventModel.TripName,
      "traveltype": eventModel.travelType,
    };

    await collectionReference.add(data);
  }
}
