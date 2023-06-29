import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:kaljit/webMobile/landingPage.dart';
import 'package:kaljit/webMobile/provider/applicationProvider.dart';
import 'package:provider/provider.dart';

class MobileWebMaterialApp extends StatefulWidget {
  const MobileWebMaterialApp({Key? key}) : super(key: key);

  @override
  State<MobileWebMaterialApp> createState() => _MobileWebMaterialAppState();
}

class _MobileWebMaterialAppState extends State<MobileWebMaterialApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationProvider(),
      child: MaterialApp(
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home:
            Consumer<ApplicationProvider>(builder: (context, provider, child) {
          return CarouselSlider(
            slideTransform: const FlipHorizontalTransform(),
            slideIndicator: CircularSlideIndicator(
              currentIndicatorColor: Colors.cyanAccent,
              indicatorBackgroundColor: Colors.grey,
              padding: const EdgeInsets.all(20),
            ),
            children: [
              const MobileLandingPage(),
              provider.application ??
                  Container(
                    color: Colors.cyan,
                  ),
            ],
          );
        }),
      ),
    );
  }
}
