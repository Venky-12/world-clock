// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;

    // if (kDebugMode) {
    //   print(data);
    // }

    String bgImage = data['isDayTime'] ? "day.png" : "night.jpg_large";
    Color bgColor = data['isDayTime'] ? Colors.pink : Colors.black;
    Color txtColor = data['isDayTime'] ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/$bgImage"), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 170.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                  child: TextButton.icon(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(
                            context, '/chooseLocation');
                        setState(() {
                          data = {
                            "location": result["location"],
                            "time": result["time"],
                            "flag": result["flag"],
                            "isDayTime": result["isDayTime"],
                          };
                        });
                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: txtColor,
                      ),
                      label: Text(
                        "Edit location",
                        style: TextStyle(
                          color: txtColor,
                        ),
                      )),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                            fontSize: 30.0,
                            letterSpacing: 2.0,
                            color: txtColor),
                      ),
                    ],
                  ),
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                      fontSize: 66.0, letterSpacing: 2.0, color: txtColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
