import 'package:http/http.dart';
import 'dart:convert';
import 'key.dart';

class WeatherData {


  List<dynamic> weather;
  Map sys;
  Map clouds;
  Map wind;

  String date2;
  String sunrise;
  String sunset;
  String weekDay;
  String Month;
  String key = Key.KEY;
  String city;
  String cloudDescription;
  String iconId;
  dynamic latitude;
  dynamic longitude;
  String main;
  dynamic temp;
  dynamic minTemp;
  dynamic maxTemp;
  int humidity;
  int cloudiness;
  double windSpeed;
  int sunrise_time;
  int sunset_time;
  double pressure;



  WeatherData({this.city});

  Future<void> getData() async {

    try {
      Response response = await get(
          'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$key');
      Map data = jsonDecode(response.body);
      print(data);

      weather = data['weather'];
      print(weather);

      Map weatherData = weather[0];
      print(weatherData);
      main = weatherData['main'];
      cloudDescription = weatherData['description'];
      iconId = weatherData['icon'];

      sys = data['sys'];
      print(sys);
      sunrise_time = sys["sunrise"];
      sunset_time = sys["sunset"];
      DateTime date = new DateTime.fromMillisecondsSinceEpoch(
          sunrise_time * 1000);

      clouds = data["clouds"];
      cloudiness = clouds['all'];
      print(cloudiness);

      print(date);
      print(date.second);
      int year = date.year;
      int month = date.month;
      int day = date.day;
      int hour = date.hour;
      int min = date.minute;
      int seconds = date.second;


      sunrise = "$hour:$min:$seconds";

      DateTime date1 = new DateTime.fromMillisecondsSinceEpoch(
          sunset_time * 1000);
      int hour1 = date1.hour;
      int min1 = date1.minute;
      int seconds1 = date1.second;

      sunset = "$hour1:$min1:$seconds1";


      Map coord;
      coord = data['coord'];
      latitude = coord['lat'];
      longitude = coord['lon'];
      Map main_weather;
      main_weather = data['main'];
      pressure = main_weather["prressure"];
      temp = main_weather['temp'];
      minTemp = main_weather['temp_min'];
      maxTemp = main_weather['temp_max'];
      humidity = main_weather['humidity'];
      pressure = main_weather["pressure"].toDouble();
      print(minTemp);
      print(maxTemp);
      print(temp);





      int weekday = date.weekday;

      switch (weekday) {
        case 1:
          {
            weekDay = "Monday";
            break;
          }
        case 2:
          {
            weekDay = "Tuesday";
            break;
          }
        case 3:
          {
            weekDay = "Wednesday";
            break;
          }
        case 4:
          {
            weekDay = "Thursday";
            break;
          }
        case 5:
          {
            weekDay = "Friday";
            break;
          }
        case 6:
          {
            weekDay = "Saturday";
            break;
          }
        case 7:
          {
            weekDay = "Sunday";
            break;
          }
      }

      switch (month) {
        case 1:
          {
            Month = "Jan";
          }
          break;
        case 2:
          {
            Month = "Feb";
          }
          break;
        case 3:
          {
            Month = "Mar";
          }
          break;
        case 4:
          {
            Month = "Apr";
          }
          break;
        case 5:
          {
            Month = "May";
          }
          break;
        case 6:
          {
            Month = "June";
          }
          break;
        case 7:
          {
            Month = "July";
          }
          break;
        case 8:
          {
            Month = "Aug";
          }
          break;
        case 9:
          {
            Month = "Sep";
          }
          break;
        case 10:
          {
            Month = "Oct";
          }
          break;
        case 11:
          {
            Month = "Nov";
          }
          break;
        case 12:
          {
            Month = "Dec";
          }
          break;
      }
      date2 = "$day" + " " + Month + " " + "$year";

      wind = data["wind"];

      windSpeed = wind["speed"].toDouble();
      print(windSpeed);
    }
    catch(e){

    }
  }
}
