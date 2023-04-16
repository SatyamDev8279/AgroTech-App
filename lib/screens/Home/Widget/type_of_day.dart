import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import '../Controllers/global_location_controller.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';

class TypeOfDay extends StatefulWidget {
  const TypeOfDay({super.key});
  @override
  State<TypeOfDay> createState() => _TypeOfDayState();
}

class _TypeOfDayState extends State<TypeOfDay> {
  String cityValue = '';
  String subCityValue = '';
  String isDay = " ••• ";
  String weather_description = " ••• ";
  String article = " ••• ";
  String URL =
      "http://api.weatherstack.com/current?access_key=feb656ff02837dcff7e8cb5495d0e86d&query=";

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    if (cityValue == "") {
      getAddress(globalController.getLatitude().value,
          globalController.getLongitude().value);
    }

    super.initState();
  }

  getAddress(lat, long) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, long);
    Placemark place = placemark[0];
    setState(() {
      cityValue = place.locality!;
      subCityValue = place.subLocality!;
      print("inside type of day class");
      print("location obtained");
      print("city = " + cityValue);
      setState(() {
        URL = URL + cityValue;
        print("updated the URL");
        print("URL = " + URL);
        callWeatherAPI(cityValue, URL);
      });
    });
  }

  callWeatherAPI(String cityForAPI, String apiURL) async {
    final response = await http.get(Uri.parse(apiURL));
    var weatherData = jsonDecode(response.body.toString());
    print("weather data = " + weatherData.toString());
    print(
        "weather desc = " + weatherData["current"]["weather_descriptions"][0]);
    if ((response.statusCode == 200)) {
      setState(() {
        weather_description = weatherData["current"]["weather_descriptions"][0]
            .toString()
            .toLowerCase();
        isDay = weatherData["current"]["is_day"] == "no" ? "night" : "day";
        var t = weather_description[0].toLowerCase();
        if ((t == "a") ||
            (t == "e") ||
            (t == "i") ||
            (t == "o") ||
            (t == "u")) {
          setState(() {
            article = "an";
          });
        } else {
          setState(() {
            article = "a";
          });
        }
      });
    } else if ((response.statusCode == 200) &&
        (weatherData["success"] == false)) {
      setState(() {
        weather_description = "loading";
        isDay = "loading";
      });
    } else {
      print("Not able to call API");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          child: Text("It's a $weather_description $isDay",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              )),
        )
      ],
    );
  }
}
