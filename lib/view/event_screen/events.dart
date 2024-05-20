import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelmate/controller/event_controller/eventcontroller.dart';
import 'package:travelmate/model/eventModelclass.dart';
import 'package:travelmate/view/event_screen/widgets/customMyTrip_widget.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<eventsControllerScreen>(context, listen: false)
          .collectionReference;
    });
    super.initState();
  }

  TextEditingController destinationcontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController budget_of_tripController = TextEditingController();
  TextEditingController intersetController = TextEditingController();
  TextEditingController trip_nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (context) => customBottomsheet(context));
            setState(() {});
          },
          child: Icon(Icons.add),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leadingWidth: 100,
              expandedHeight: 100,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  "https://images.pexels.com/photos/1891882/pexels-photo-1891882.jpeg?auto=compress&cs=tinysrgb&w=400",
                  fit: BoxFit.cover,
                ),
              ),
              leading: Column(
                children: [
                  Text(" my location"),
                  Text(
                    "My Trips",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              actions: [
                CircleAvatar(
                  child: Icon(Icons.person_sharp),
                  // backgroundColor: Colors.black,
                ),
              ],
            ),
            SliverList.separated(
              itemBuilder: (context, index) => CustomTrips(),
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              itemCount: 5,
            )
          ],
        ));
  }

  customBottomsheet(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30)
            .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
        color: Colors.green.shade900.withOpacity(.6),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: destinationcontroller,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  hintText: "Destination",
                  border: OutlineInputBorder(),
                  focusedBorder: UnderlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: datecontroller,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  hintText: "date",
                  suffixIcon: Icon(Icons.date_range_outlined),
                  border: OutlineInputBorder(),
                  focusedBorder: UnderlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: budget_of_tripController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  hintText: "budget of trip",
                  suffixIcon: Icon(Icons.note_alt_outlined),
                  border: OutlineInputBorder(),
                  focusedBorder: UnderlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: intersetController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  hintText: "choose your interset",
                  suffixIcon: Icon(Icons.favorite),
                  border: OutlineInputBorder(),
                  focusedBorder: UnderlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: trip_nameController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  hintText: "Trip name",
                  border: OutlineInputBorder(),
                  focusedBorder: UnderlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Travel with?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Consumer<eventsControllerScreen>(
              builder: (BuildContext context, value, Widget? child) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      context.read<eventsControllerScreen>().changeType("solo");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: value.selectedType == "solo"
                              ? Colors.green
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text("Solo",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25))),
                      height: 50,
                      width: 160,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      value.changeType("party");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: value.selectedType == "party"
                              ? Colors.green
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text("Party",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25))),
                      height: 50,
                      width: 160,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                await context.read<eventsControllerScreen>().addData(EventModel(
                    destination: destinationcontroller.text,
                    TripName: trip_nameController.text,
                    budget_of_trip: int.tryParse(budget_of_tripController.text),
                    date: datecontroller.text,
                    choose_your_interset: intersetController.text,
                    travelType:
                        context.read<eventsControllerScreen>().selectedType));
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("sucess")));
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text("Start my trip",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.green.shade900))),
                height: 50,
                width: 300,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
