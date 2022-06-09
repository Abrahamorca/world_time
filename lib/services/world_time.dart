import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  late String location; // location name for the UI
  late String time; // the time in that location
  late String flag; // url to an asset flag icon
  late String url; // this is the location url for api endpoint
  late bool isDayTime; // true or false if daytime or not

  WorldTime({ required this.location, required this.flag, required this.url} );


  Future<void> getTime() async {

    try {

      Map data;
      Response response;

      String datetime;
      String offset;

      DateTime now;

      //make the request
      response = await get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
      data = jsonDecode(response.body);

      // get properties from data
      datetime = data['datetime'];
      offset = data['utc_offset'].substring(1,3);

      // create DateTime object
      now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      isDayTime = (now.hour > 6) && (now.hour < 12);

      time = DateFormat.jm().format(now);
    } catch (e) {

      time = 'could not get time data';
    }

  }
}