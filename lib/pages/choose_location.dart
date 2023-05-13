import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations=[
    WorldTime(flag: 'uk.png', location: "London", url: 'Europe/London'),
    WorldTime(flag: 'greece.png', location: "Athens", url: 'Europe/Berlin'),
    WorldTime(flag: 'egypt.png', location: "Cairo", url: 'Africa/Cairo'),
    WorldTime(flag: 'kenya.png', location: "Nairobi", url: 'Africa/Nairobi'),
    WorldTime(flag: 'usa.png', location: "Chicago", url: 'America/Chicago'),
    WorldTime(flag: 'south_korea.png', location: "Seoul", url: 'Asia/Seoul'),
    WorldTime(flag: 'indonesia.png', location: "Jakarta", url: 'Asia/Jakarta'),
    WorldTime(flag: 'usa.png', location: "New York", url: 'America/New_York'),
  ];

  void updateTime(index) async
  {
    WorldTime instance=locations[index];
    await instance.getTime();

    //navigate back to home screen
    // ignore: use_build_context_synchronously
    Navigator.pop(context,{
      "location":instance.location,
      "time":instance.time,
      "flag":instance.flag,
      "isDayTime":instance.isDayTime,
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text("Choose a location"),
        centerTitle: true,
        elevation: 0.0,
      ),

      body: ListView.builder(
        itemCount: locations.length,
          itemBuilder:(BuildContext context,int index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 1.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(
                  locations[index].location
                ),

                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/${locations[index].flag}"),
                ),
              ),
            ),
          );
          },
      ),

    );
  }
}
