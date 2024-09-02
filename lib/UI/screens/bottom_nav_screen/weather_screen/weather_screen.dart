import 'package:agri_guardian/UI/screens/bottom_nav_screen/weather_screen/weather_controller.dart';
import 'package:agri_guardian/core/constants/const_colors.dart';
import 'package:agri_guardian/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../generated/assets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late WeatherModel weatherInfo;

  myWeather() {
    WeatherController _weatherController = Get.put(WeatherController());
    _weatherController.fetchWeather().then((value) {
      setState(() {
        weatherInfo = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    weatherInfo = WeatherModel(
      name: '',
      temperature: Temperature(current: 0.0),
      humidity: 0,
      wind: Wind(speed: 0.0),
      maxTemperature: 0,
      minTemperature: 0,
      pressure: 0,
      seaLevel: 0,
      weather: [],
    );
    myWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('EEEE d,MMMM yyyy').format(DateTime.now());
    String formattedTime = DateFormat('hh:mm a').format(DateTime.now());
    return SafeArea(
      child: Scaffold(
        // backgroundColor: ConstColor.primaryColor.value.withOpacity(0.7),
        backgroundColor: ConstColor.primaryColor.value,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WeatherWidget(
                weather: weatherInfo,
                formattedDate: formattedDate,
                formattedTime: formattedTime,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherWidget extends StatelessWidget {
  final WeatherModel weather;
  final String formattedDate;
  final String formattedTime;

  WeatherWidget(
      {required this.weather,
      super.key,
      required this.formattedDate,
      required this.formattedTime});

  @override
  Widget build(BuildContext context) {
    final weatherImage =
        weather.weather.isNotEmpty && weather.weather[0].main == 'Clouds'
            ? Assets.cloudy_pic
            : Assets.sunny_pic;
    return Column(
      children: [
        Text(
          weather.name.toString(),
          style: GoogleFonts.zenAntique(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: ConstColor.kWhite.value),
        ),
        Text(
          "Temp: ${weather.temperature.current.toStringAsFixed(2)}°C",
          style: GoogleFonts.zenAntique(
              fontSize: 19,
              fontWeight: FontWeight.w300,
              color: Colors.yellowAccent),
        ),
        if (weather.weather.isNotEmpty)
          Text(
            weather.weather[0].main,
            style: GoogleFonts.zenAntique(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Color(0xfffafa79)),
          ),
        Text(
          formattedDate,
          style: GoogleFonts.zenAntique(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: ConstColor.kblack.value),
        ),
        Text(
          formattedTime,
          style: GoogleFonts.zenAntique(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: ConstColor.kblack.value),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 25.h,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(weatherImage),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h),
          child: Container(
            height: 250,
            decoration: BoxDecoration(
              color: ConstColor.primaryColor.value.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: ConstColor.kblack.value),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.wind_power,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 5),
                          weatherInfoCard(
                              title: "Wind",
                              value: "${weather.wind.speed}km/h"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.sunny,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 5),
                          weatherInfoCard(
                              title: "Max",
                              value:
                                  "${weather.maxTemperature.toStringAsFixed(2)}°C"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.wind_power,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 5),
                          weatherInfoCard(
                              title: "Min",
                              value:
                                  "${weather.minTemperature.toStringAsFixed(2)}°C"),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.water_drop,
                            color: Colors.amber,
                          ),
                          const SizedBox(height: 5),
                          weatherInfoCard(
                              title: "Humidity", value: "${weather.humidity}%"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.air,
                            color: Colors.amber,
                          ),
                          const SizedBox(height: 5),
                          weatherInfoCard(
                              title: "Pressure",
                              value: "${weather.pressure}hPa"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.leaderboard,
                            color: Colors.amber,
                          ),
                          const SizedBox(height: 5),
                          weatherInfoCard(
                              title: "Sea-Level",
                              value: "${weather.seaLevel}m"),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Column weatherInfoCard({required String title, required String value}) {
  return Column(
    children: [
      Text(
        value,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
      Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      )
    ],
  );
}
