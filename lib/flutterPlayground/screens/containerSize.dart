import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/myNavigationDrawer.dart';
import '../components/mySlider.dart';
import '../provider/parameterProvider.dart';

class ContainerSize extends StatefulWidget {
  const ContainerSize({super.key});

  @override
  State<ContainerSize> createState() => _ContainerSizeState();
}

class _ContainerSizeState extends State<ContainerSize> {
  bool isHeightSelected = true;
  bool isWidthSelected = false;
  bool isBorderRadiusSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyNavigationDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Play with Container Size',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.center,
                    child: Consumer<ParameterProvider>(
                        builder: (context, provider, child) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: provider.width,
                        height: provider.height,
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius:
                                BorderRadius.circular(provider.borderRadius)),
                      );
                    }),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                color: Colors.deepPurple.withOpacity(0.1),
                child: Column(
                  children: [
                    Consumer<ParameterProvider>(
                        builder: (context, provider, child) {
                      return Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10,
                            left: 10,
                            right: 10,
                          ),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              if (isHeightSelected) {
                                return MySlider(
                                  parameter: provider.height,
                                  max: 600,
                                  min: 10,
                                );
                              } else if (isWidthSelected) {
                                return MySlider(
                                  parameter: provider.width,
                                  max: 400,
                                  min: 10,
                                );
                              } else {
                                return MySlider(
                                  parameter: provider.borderRadius,
                                  max: 200,
                                  min: 0,
                                );
                              }
                            },
                          ));
                    }),
                    SizedBox(
                      height: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                              color: isHeightSelected
                                  ? Colors.deepPurple.withOpacity(0.01)
                                  : Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isHeightSelected = true;
                                    isWidthSelected = false;
                                    isBorderRadiusSelected = false;
                                  });
                                },
                                child: const Column(
                                  children: [
                                    Icon(Icons.arrow_upward, size: 45),
                                    Text('Height')
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: isWidthSelected
                                  ? Colors.deepPurple.withOpacity(0.01)
                                  : Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isHeightSelected = false;
                                    isWidthSelected = true;
                                    isBorderRadiusSelected = false;
                                  });
                                },
                                child: const Column(
                                  children: [
                                    Icon(Icons.arrow_forward, size: 45),
                                    Text('Width')
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: isBorderRadiusSelected
                                  ? Colors.deepPurple.withOpacity(0.01)
                                  : Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isHeightSelected = false;
                                    isWidthSelected = false;
                                    isBorderRadiusSelected = true;
                                  });
                                },
                                child: const Column(
                                  children: [
                                    Icon(Icons.roundabout_left, size: 45),
                                    Text(
                                      'Border Radius',
                                      style: TextStyle(fontSize: 11),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     const Text(
                    //       '  Width',
                    //       style: TextStyle(
                    //         fontSize: 20,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 320,
                    //       child: Slider(
                    //         value: _width,
                    //         min: 10,
                    //         max: 400,
                    //         onChanged: (value) {
                    //           setState(() {
                    //             _width = value;
                    //           });
                    //         },
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     const Text(
                    //       '  Size',
                    //       style: TextStyle(
                    //         fontSize: 20,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 320,
                    //       child: Slider(
                    //         value: _height,
                    //         min: 10,
                    //         max: 600,
                    //         onChanged: (value) {
                    //           setState(() {
                    //
                    //           });
                    //         },
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     const Text(
                    //       '  Border Radius',
                    //       style: TextStyle(
                    //         fontSize: 13,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 300,
                    //       child: Slider(
                    //         value: _borderRadius,
                    //         min: 0,
                    //         max: 200,
                    //         onChanged: (value) {
                    //           setState(() {
                    //
                    //           });
                    //         },
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
