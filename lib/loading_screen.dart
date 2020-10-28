import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/weather_data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupData()async{
    WeatherData data = WeatherData(city: "Pune");
    await data.getData();
    if(data.main!=null){
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      "city" : data.city,
      "latitude" : data.latitude,
      "longitude" : data.longitude,
      "main_weather": data.main,
      "current_temp" : data.temp,
      "max_temp": data.maxTemp,
      "min_temp" : data.minTemp,
      "humidity": data.humidity,
      "cloud_description" : data.cloudDescription,
      "date": data.date2,
      "weekday":data.weekDay,
      "sunrise": data.sunrise,
      "sunset": data.sunset,
      "cloudiness": data.cloudiness,
      "pressure": data.pressure,
      "windspeed": data.windSpeed,
    });
  }
    else{
      Navigator.pushNamed(context, '/exception');
    }
  }


  @override
  void initState(){
    super.initState();

     setupData();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg2.jpeg"),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 240,),
              Text("Weather Forecast",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w900,))),
              SizedBox(height: 10,),
              SpinKitFadingCircle(
                color: Colors.white,
                size: 50,
              ),
              Text("check before you leave",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w500)))
            ],
          ),
        ),
      ),
    );
  }
}
