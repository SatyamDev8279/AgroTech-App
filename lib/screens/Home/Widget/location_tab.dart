import 'package:flutter/material.dart';
import '../Controllers/global_location_controller.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';

class LocationTab extends StatefulWidget {
  const LocationTab({
    super.key,
  });
  @override
  State<LocationTab> createState() => _LocationTabState();
}

class _LocationTabState extends State<LocationTab> {
  String cityValue = ' ••• ';
  String subCityValue = '';

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    if (cityValue == " ••• ") {
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
      print("Inside the Location Tab");
      print("location obtained");
      print("city = " + cityValue);
      print("closing Location Tab");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 150,
      padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
      decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20)),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.my_location_outlined,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            cityValue,
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
