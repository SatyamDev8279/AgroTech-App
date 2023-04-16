import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import '../../chatbot.dart';
import '../../govsites.dart';
import '../crops/crop_gallery.dart';
import '../crops/crop_guide.dart';
import '../crops/trending_disease.dart';
import 'Controllers/global_location_controller.dart';
import 'Widget/hello_text.dart';
import 'Widget/location_tab.dart';
import 'Widget/type_of_day.dart';
import 'Widget/weather_details.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.32,
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
              decoration: const BoxDecoration(
                color: Color(0xff20c773),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HelloText(),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TypeOfDay(),
                      LocationTab(),
                    ],
                  )
                ],
              )),
          Positioned(
            top: 25,
            bottom: 0,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              // physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const WeatherDetailsCard(),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.04, 0, 0, 0),
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.92,
                    decoration: BoxDecoration(
                        color: Color(0xff20c773),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent.withOpacity(0.2),
                        ),
                        const Text(
                          "Diagnosis issue with the crop",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.04, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Gallery",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => crop_guide()));
                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                              margin: EdgeInsets.only(right: 20),
                              child: Text(
                                "More",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  crop_gallery(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.04, 0, 0, 0),
                    child: Text(
                      "Trending Diseases",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  trending_disease(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.04, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Need Help ! Come Here",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => chatbot()));
                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                              margin: EdgeInsets.only(right: 20),
                              child: Text(
                                "Tap here",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.04, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Helpful Sites",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Govsites()));
                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                              margin: EdgeInsets.only(right: 20),
                              child: Text(
                                "Tap here",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
