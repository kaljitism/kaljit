import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaljit/webMobile/provider/applicationProvider.dart';
import 'package:parallax_sensors_bg/parallax_sensors_bg.dart';
import 'package:provider/provider.dart';

class MobileLandingPage extends StatefulWidget {
  const MobileLandingPage({super.key});

  @override
  State<MobileLandingPage> createState() => _MobileLandingPageState();
}

class _MobileLandingPageState extends State<MobileLandingPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1D1D1F),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 600,
              width: double.maxFinite,
              child: Parallax(
                sensor: ParallaxSensor.accelerometer,
                layers: [
                  Layer(
                      sensitivity: 12,
                      child: Container(
                        height: 400,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xff2D2F33),
                        ),
                        margin: const EdgeInsets.all(10),
                      )),
                  Layer(
                      sensitivity: 7,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 300),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'kaljit',
                                style: GoogleFonts.jetBrainsMono(
                                  textStyle: const TextStyle(
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(5, 5),
                                        blurRadius: 3,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ],
                                    fontSize: 60,
                                    color: Colors.cyan,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'full-stack developer',
                                style: GoogleFonts.jetBrainsMono(
                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.cyan,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'android, iOS, web, linux, embedded',
                                style: GoogleFonts.jetBrainsMono(
                                  textStyle: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.cyan,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Text(
                                textAlign: TextAlign.center,
                                'choose the app of your choice\n& swipe left to see\nthe code in action',
                                style: GoogleFonts.jetBrainsMono(
                                  shadows: <Shadow>[
                                    const Shadow(
                                      offset: Offset(5, 5),
                                      blurRadius: 2.0,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ],
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.cyan,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              child: DropdownMenuTheme(
                data: DropdownMenuThemeData(
                  inputDecorationTheme: InputDecorationTheme(
                    filled: true,
                    fillColor: Colors.cyan.shade400,
                    labelStyle: GoogleFonts.jetBrainsMono(
                      color: Colors.black,
                    ),
                    hoverColor: Colors.cyan.shade600,
                  ),
                ),
                child: Consumer<ApplicationProvider>(
                    builder: (context, provider, child) {
                  return DropdownMenu(
                    onSelected: (value) {
                      provider.onMenuItemSelection(value);
                    },
                    menuStyle: MenuStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.cyan.shade300,
                      ),
                      fixedSize: MaterialStateProperty.all(
                        const Size.fromWidth(300),
                      ),
                    ),
                    width: 300,
                    label: const Text('Application'),
                    dropdownMenuEntries: const [
                      DropdownMenuEntry(
                        value: 1,
                        label: 'Chess Timer',
                      ),
                      DropdownMenuEntry(
                        value: 2,
                        label: 'Productivity Companion',
                      ),
                      DropdownMenuEntry(
                        value: 3,
                        label: 'Tetris',
                      ),
                      DropdownMenuEntry(
                        value: 4,
                        label: 'Flutter Playground',
                      )
                    ],
                  );
                }),
              ),
            ),
            const SizedBox(height: 100),
            GestureDetector(
              onTap: () {
                html.window.open(
                    'https://www.linkedin.com/in/aditya-dwivedi-857aa2155/',
                    '_blank');
              },
              child: Material(
                color: const Color(0xff1D1D1F),
                elevation: 10,
                shadowColor: Colors.cyan,
                child: Container(
                  height: 100,
                  width: 300,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/upWork.png', height: 50),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Hire me on\nUpwork',
                        style: GoogleFonts.jetBrainsMono(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                html.window.open(
                  'https://play.google.com/store/apps/developer?id=Aditya+Dwivedi',
                  "_blank",
                );
              },
              child: Material(
                color: const Color(0xff1D1D1F),
                elevation: 10,
                shadowColor: Colors.cyan,
                child: Container(
                  height: 100,
                  width: 300,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/googlePlay.png', height: 50),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Get my apps from\nPlayStore',
                        style: GoogleFonts.jetBrainsMono(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                html.window.open(
                    'https://www.linkedin.com/in/aditya-dwivedi-857aa2155/',
                    '_blank');
              },
              child: Material(
                color: const Color(0xff1D1D1F),
                elevation: 10,
                shadowColor: Colors.cyan,
                child: Container(
                  height: 100,
                  width: 300,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/linkedIN.png', height: 50),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Connect with me on\nLinkedIn',
                        style: GoogleFonts.jetBrainsMono(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}
