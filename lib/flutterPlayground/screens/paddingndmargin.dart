import 'package:flutter/material.dart';

import '../components/myNavigationDrawer.dart';

class PaddingAndMargin extends StatefulWidget {
  const PaddingAndMargin({super.key});

  @override
  State<PaddingAndMargin> createState() => _PaddingAndMarginState();
}

class _PaddingAndMarginState extends State<PaddingAndMargin> {
  double padding = 0;
  double margin = 0;
  double size = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyNavigationDrawer(),
      appBar: AppBar(
        title: const Text('Padding and Margin'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  color: Colors.blueGrey,
                  child: Align(
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      height: 700,
                      width: 400,
                      padding: EdgeInsets.all(padding),
                      margin: EdgeInsets.all(margin),
                      duration: const Duration(milliseconds: 200),
                      color: Colors.black,
                      child: const FlutterLogo(size: 40),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '  Padding',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: Slider(
                          value: padding,
                          min: 0,
                          max: 150,
                          onChanged: (value) {
                            setState(() {
                              padding = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '  Margin',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: Slider(
                          value: margin,
                          min: 0,
                          max: 130,
                          onChanged: (value) {
                            setState(() {
                              margin = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
