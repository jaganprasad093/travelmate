import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travelmate/model/eventModelclass.dart';

class eventsControllerScreen with ChangeNotifier {
  var collectionReference = FirebaseFirestore.instance.collection("events");
  String selectedType = "solo";
  List<EventModel> eventList = [];

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

  addEventListner() {
    collectionReference.snapshots().listen((event) {
      eventList = event.docs.map((e) {
        return EventModel(
          TripName: e.data()["trip_name"],
          budget_of_trip: e.data()["budget_of_trip"],
          date: e.data()["date"],
          choose_your_interset: e.data()["choose_your_interset"],
          destination: e.data()["destination"],
          travelType: e.data()["traveltype"],
        );
      }).toList();
      notifyListeners();
    });
  }
}
