import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Forgetpass extends StatelessWidget {
  static const String idScreen = 'forgot';
  const Forgetpass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Stack(

          children: [
            BackgroundImage(),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'signin', (route) => false);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  "Forgot Password",
                  style: GoogleFonts.acme(
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: size.width * 0.8,
                          child: Text(
                            "Enter your Email , we will send the reset "
                            "settings to reset your password",
                            style: GoogleFonts.acme(
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 25),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[600]?.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(16)),
                                child: TextField(
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.symmetric(vertical: 15),
                                    border: InputBorder.none,
                                    hintText: 'Email',
                                    prefixIcon: Icon(
                                      FontAwesomeIcons.envelope,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    hintStyle: GoogleFonts.merriweather(
                                        fontSize: 22, color: Colors.white),
                                  ),
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(style: ElevatedButton.styleFrom(
                          primary: Colors.green,

                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(21)
                            )
                        ),
                            onPressed: () {},
                            child: Container(
                              height: 50,
                              width: 310,
                              child: Center(
                                child: Text(
                                  "Send",
                                  style: GoogleFonts.acme(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.lightGreen, Colors.lightGreen],
              begin: Alignment.bottomCenter,
              end: Alignment.center)
          .createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/backwla.jpeg'),
              fit: BoxFit.fill,
              colorFilter:
                  ColorFilter.mode(Colors.lightGreen, BlendMode.hardLight)),
        ),
      ),
    );
  }
}
