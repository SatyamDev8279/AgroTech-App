import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GlobalController extends GetxController {
  String apiURL =
      "http://api.weatherstack.com/current?access_key=feb656ff02837dcff7e8cb5495d0e86d&query=Kotri Kalan";
  final RxBool _isLoading = true.obs;
  final RxString _cityName = "".obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxString weatherDesc = "".obs;
  final RxInt temperature = 0.obs;
  final RxInt humidity = 0.obs;
  final RxInt rainfall = 0.obs;
  final RxInt windspeed = 0.obs;
  final RxBool isDay = false.obs;
  var weatherData = {};

  RxBool checkLoading() => _isLoading;
  RxString getCity() => _cityName;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;
  RxString getWeatherDesc() => weatherDesc;
  RxInt getTemperature() => temperature;
  RxInt getHumidity() => humidity;
  RxInt getRainfall() => rainfall;
  RxInt getWindSpeed() => windspeed;

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return Future.error("Location not enabled");
    }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission is denied forever.");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission is denied .");
      }
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;
      _latitude.value = value.latitude;
      _isLoading.value = false;
    });
  }

  callWeatherAPI() async {
    return await http.get(Uri.parse(apiURL)).then((apiValue) {
      var weatherData = jsonDecode(apiValue.body.toString());
      if (apiValue.statusCode == 200) {
        temperature.value = weatherData["current"]["temperature"];
        humidity.value = weatherData["current"]["humidity"];
        windspeed.value = weatherData["current"]["wind_speed"];
        rainfall.value = weatherData["current"]["precip"];
        weatherDesc.value = weatherData["current"]["weather_descriptions"][0];
        isDay.value = weatherData["current"]["is_day"] == "no" ? false : true;
      }
    });
  }
}
