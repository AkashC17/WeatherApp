import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                color: Colors.yellow[800],
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: MediaQuery.of(context).size.height * 0.035,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Settings",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.025,
                                fontWeight: FontWeight.w700)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/location.svg",
                width: MediaQuery.of(context).size.height * 0.035,
              ),
              title: Text(
                'Choose Location',
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                )),
              ),
              onTap: () async {
                dynamic result =
                    await Navigator.pushNamed(context, '/location');
                setState(() {
                  data = {
                    "city": result['city'],
                    "cloud_description": result['cloud_description'],
                    "latitude": result['latitude'],
                    "longitude": result['longitude'],
                    "main_weather": result['main_weather'],
                    "current_temp": result['current_temp'],
                    "max_temp": result['max_temp'],
                    "min_temp": result["min_temp"],
                    "humidity": result['humidity'],
                    "date": result["date"],
                    "weekday": result["weekday"],
                    "sunrise": result["sunrise"],
                    "sunset": result["sunset"],
                    "cloudiness": result["cloudiness"],
                    "pressure": result["pressure"],
                    "windspeed": result["windspeed"]
                  };
                });
              },
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Developed by: ",
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                  Text("  Akash Cheke",
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700)))
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Weather",
            style: GoogleFonts.openSans(
              textStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
            )),
        backgroundColor: Colors.yellow[800],
        elevation: 1,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height * 0.03),
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/bgimg.jpeg',
                      ),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                  ),
                                  Row(children: [
                                    SvgPicture.asset(
                                      'assets/placeholder.svg',
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                    ),
                                    Text(data['city'],
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                          fontWeight: FontWeight.w700,
                                        ))),
                                  ]),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "   lat = ",
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.017)),
                                        ),
                                        Text(
                                            data['latitude'].toString() + " / ",
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.017))),
                                        Text('lon = ',
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.017))),
                                        Text(data['longitude'].toString(),
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.017))),
                                      ]),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.043),
                                  Text(
                                      data["weekday"] == null
                                          ? " "
                                          : data["weekday"],
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.029,
                                              fontWeight: FontWeight.w700))),
                                  SizedBox(
                                    height: 0,
                                  ),
                                  Text(
                                      data["date"] == null ? " " : data["date"],
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.029,
                                              fontWeight: FontWeight.w700))),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                    data['main_weather'] == null
                                        ? " "
                                        : data['main_weather'] + " : ",
                                    // "Thunderstorm:",
                                    style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.027,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800),
                                    )),
                              ),
                              Text(
                                  data["cloud_description"] == null
                                      ? " "
                                      : data["cloud_description"],
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.024,
                                  )))
                            ],
                          ),
                        ]))),
          ),
          Divider(
            thickness: 1,
            color: Colors.black12,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      "assets/sunrise.svg",
                      width: MediaQuery.of(context).size.width * 0.14,
                    ),
                    // SizedBox(height: 10,)
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Text(
                data["sunrise"] == null ? " " : data["sunrise"],
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.06),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/sunset.svg",
                      width: MediaQuery.of(context).size.width * 0.14,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Text(
                data["sunset"] == null ? " " : data["sunset"],
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.06),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: Colors.black12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.011,
              ),
              SvgPicture.asset(
                'assets/hot.svg',
                width: MediaQuery.of(context).size.height * 0.032,
              ),
              Text(' Temperature: ',
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize:
                              MediaQuery.of(context).size.width * 0.055))),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.orange[200]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("min : ",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500))),
                    Text(
                      data["min_temp"].toString(),
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.orange[400]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("current: ",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500))),
                    Text(data["current_temp"].toString(),
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        )),
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.orange[600]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("max: ",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500))),
                    Text(data["max_temp"].toString(),
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        )),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: Colors.black12,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            // width: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/humidity.svg',
                      width: 20,
                    ),
                    Text(' Humidity: ',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20))),
                    SizedBox(
                      width: 10,
                    ),
                    // VerticalDivider(thickness: 10,color: Colors.red,width: 10,),
                    SvgPicture.asset("assets/cloudy.svg", width: 30),
                    Text(' Cloudiness: ',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20))),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    SleekCircularSlider(
                      appearance: CircularSliderAppearance(
                          customWidths:
                              CustomSliderWidths(progressBarWidth: 10),
                          size: 130,
                          startAngle: 180,
                          angleRange: 360,
                          customColors: CustomSliderColors(
                              trackColor: Colors.indigo[300],
                              progressBarColor: Colors.indigo[900],
                              dotColor: Colors.white)),
                      min: 0,
                      max: 100,
                      initialValue: data['humidity'].toDouble(),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        SleekCircularSlider(
                          appearance: CircularSliderAppearance(
                              customWidths:
                                  CustomSliderWidths(progressBarWidth: 10),
                              size: 130,
                              startAngle: 180,
                              angleRange: 360,
                              customColors: CustomSliderColors(
                                  trackColor: Colors.indigo[300],
                                  progressBarColor: Colors.indigo[900],
                                  dotColor: Colors.white)),
                          min: 0,
                          max: 100,
                          initialValue: data['cloudiness'].toDouble(),
                        ),
                      ],
                    )
                  ],
                ),
                // SizedBox(width: 60,)
              ],
            ),
          ),
          // SizedBox(height: 100,child: Text("ajshdka",style:TextStyle(fontSize: 50),),)
          Divider(
            thickness: 1,
            color: Colors.black12,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 10,
              ),
              SvgPicture.asset(
                'assets/speed.svg',
                width: 20,
              ),
              Text(" Wind Speed:",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700))),
              SizedBox(width: 10),
              SvgPicture.asset(
                'assets/meter.svg',
                width: 20,
              ),
              Text(" Pressure:",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700))),
            ],
          ),

          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    data["windspeed"].toString(),
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500)),
                  ),
                  Container(
                    width: 60,
                    height: 30,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "/mph",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                data["pressure"].toString(),
                style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 30)),
              ),
              Container(
                width: 50,
                height: 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "/hpa",
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(fontSize: 15)),
                    ),
                  ],
                ),
              ),
              // SizedBox(width: 20,),
            ],
          ),
          Divider(
            thickness: 1,
            color: Colors.black12,
          ),
        ],
      )),
    );
  }
}
