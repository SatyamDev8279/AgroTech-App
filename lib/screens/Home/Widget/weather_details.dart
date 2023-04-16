import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import '../Controllers/global_location_controller.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'charcode'

class WeatherDetailsCard extends StatefulWidget {
  const WeatherDetailsCard({super.key});
  @override
  State<WeatherDetailsCard> createState() => _WeatherDetailsCardState();
}

class _WeatherDetailsCardState extends State<WeatherDetailsCard> {
  Widget getTemperature(String temp) {
    return Row(children: [
      const CircleAvatar(
        backgroundColor: Colors.green,
        child: Icon(
          Icons.thermostat_outlined,
          color: Colors.white,
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$temp °C",
            style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const Text(
            "Temperature",
            style: TextStyle(color: Colors.black38, fontSize: 15),
          )
        ],
      )
    ]);
  }

  Widget getRainfall(String rainf) {
    return Row(children: [
      const CircleAvatar(
        backgroundColor: Color(0xffa103fc),
        child: Icon(
          WeatherIcons.rain,
          color: Colors.white,
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$rainf mm",
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const Text(
            "Rainfall",
            style: TextStyle(color: Colors.black38, fontSize: 15),
          )
        ],
      )
    ]);
  }

  Widget getHumidity(String humidity) {
    return Row(children: [
      const CircleAvatar(
        backgroundColor: Color(0xff177dd1),
        child: Icon(
          Icons.water_drop_outlined,
          color: Colors.white,
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$humidity %",
            style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const Text(
            "Humidity",
            style: TextStyle(color: Colors.black38, fontSize: 15),
          )
        ],
      )
    ]);
  }

  Widget getWindSpeed(String wind) {
    return Row(children: [
      const CircleAvatar(
        backgroundColor: Color(0xffd6d31e),
        child: Icon(
          WeatherIcons.windy,
          color: Colors.white,
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$wind ms\u207B\u00B9",
            style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const Text(
            "Wind Speed",
            style: TextStyle(color: Colors.black38, fontSize: 15),
          )
        ],
      )
    ]);
  }

  getAddress(lat, long) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, long);
    Placemark place = placemark[0];
    setState(() {
      cityValue = place.locality!;
      subCityValue = place.subLocality!;
      if ((place.locality) == "Kothri Kalan") {
        cityValue = "Kotri Kalan";
      }
      print("inside weather class");
      print("location obtained");
      print("city = " + cityValue);
      setState(() {
        URL = URL + cityValue;
        print("updated the URL for weather class");
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
        temperature =
            weatherData["current"]["temperature"].toString().toLowerCase();
        rainfall = weatherData["current"]["precip"].toString().toLowerCase();
        humidity = weatherData["current"]["humidity"].toString().toLowerCase();
        windspeed =
            weatherData["current"]["wind_speed"].toString().toLowerCase();
      });
    } else if ((response.statusCode == 200) &&
        (weatherData["success"] == false)) {
      setState(() {
        temperature = " ••• ";
        rainfall = " ••• ";
        humidity = " ••• ";
        windspeed = " ••• ";
      });
    } else {
      print("Not able to call API");
    }
  }

  String cityValue = '';
  String subCityValue = '';
  String temperature = " ••• ";
  String rainfall = " ••• ";
  String humidity = " ••• ";
  String windspeed = " ••• ";
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

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.04,
            MediaQuery.of(context).size.height * 0.23, 0, 0),
        height: 170,
        width: MediaQuery.of(context).size.width * 0.92,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2),
            color: Colors.white,
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getTemperature(temperature),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.18,
                ),
                getRainfall(rainfall),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getHumidity(humidity),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.18,
                ),
                getWindSpeed(windspeed),
              ],
            )
          ],
        ));
  }
}
