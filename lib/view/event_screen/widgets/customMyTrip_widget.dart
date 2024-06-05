import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelmate/controller/event_controller/eventcontroller.dart';
import 'package:travelmate/model/eventModelclass.dart';

class CustomTrips extends StatelessWidget {
  const CustomTrips({super.key, required this.event});
  final EventModel event;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.4),
            borderRadius: BorderRadius.circular(10)),
        height: 400,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<eventsControllerScreen>(
                builder: (context, value, child) => Container(
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: event.travelType == "solo"
                              ? NetworkImage(
                                  "https://www.shutterstock.com/image-vector/solo-travel-character-traveling-alone-260nw-2351313483.jpg")
                              : NetworkImage(
                                  "https://www.shutterstock.com/image-vector/vector-cartoon-teenagers-road-trip-260nw-390734020.jpg")),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    event.TripName ?? "",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text(
                        event.destination ?? "",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                event.date ?? "",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              )
            ],
          ),
        ),
      ),
    );
  }
}
