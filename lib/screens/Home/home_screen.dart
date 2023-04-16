import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/screens/Home/dashboard.dart';
import 'Controllers/global_location_controller.dart';

class home_screen extends StatelessWidget {
  static const String idScreen = 'home_screen';
  home_screen({super.key});
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Obx((() => globalController.checkLoading().isTrue
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Dashboard())),
    ));
  }
}
