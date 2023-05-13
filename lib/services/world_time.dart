import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  late String location; //location name for the ui
  late String url; //location url for the api
  late String time; //the time in that location
  late String flag; //url to an asset flag icon
  late bool isDayTime;

  WorldTime({required this.flag, required this.location, required this.url});

  Future<void> getTime() async {
    var Url = Uri.parse("http://worldtimeapi.org/api/timezone/$url");
    var response = await http.get(Url);
    //to print the data
    Map data = jsonDecode(response.body);
    print(data);

    //to get properties from the data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].toString().substring(1, 3);
    print(datetime);
    print(offset);

    //Create a datetime object

    DateTime now = DateTime.parse(datetime);

    now = now.add(Duration(hours: int.parse(offset)));

    //since india offset is +5:30
    //for hours i.e.,5
    //for minutes i.e.,30
    // now=now.add(const Duration(minutes: 30));

    //set the time property
    isDayTime = (now.hour > 6 && now.hour < 20) ? true : false;
    time = DateFormat.jm().format(now);
  }
}
