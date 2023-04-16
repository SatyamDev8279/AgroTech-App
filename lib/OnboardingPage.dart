import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade200,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // wrap this in a widget and name it image
            ImageWidget(height: height),
            // wrap this in a widget and name it body
            const BodyWidget()
          ],
        ),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Let's Plant together \nwith Us",
              style: GoogleFonts.fredokaOne(
                  decoration: TextDecoration.none,
                  letterSpacing: 1,
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            "A man doesn't plant a tree for himself. He plants it for posterity.",
            style: GoogleFonts.poppins(
                decoration: TextDecoration.none,
                fontSize: 14,
                color: Colors.black38,
                fontWeight: FontWeight.w500),
          ),
          // Wrap this in a widget and name it button
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: 120,
              child: ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(horizontal: 20)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ))),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'signin', (route) => false);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Let's Go!",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height * .5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
          image: const DecorationImage(
              image: AssetImage("assets/images/backwla.jpeg"),
              fit: BoxFit.cover)),
    );
  }
}
