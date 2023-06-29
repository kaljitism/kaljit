import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaljit/chessTimer/homepage.dart';
import 'package:kaljit/flutterPlayground/main.dart';
import 'package:kaljit/tetris/board.dart';
import 'package:kaljit/webPC/Provider/CodeProvider.dart';
import 'package:provider/provider.dart';

import '../productivityCompanion/main.dart';

class PCWebMaterialApp extends StatefulWidget {
  const PCWebMaterialApp({super.key});

  @override
  State<PCWebMaterialApp> createState() => _PCWebMaterialAppState();
}

class _PCWebMaterialAppState extends State<PCWebMaterialApp>
    with TickerProviderStateMixin {
  bool isKaljitHovering = false;
  bool isTheCodeHovering = false;

  bool playStoreButtonHovering = false;
  bool linkedInButtonHovering = false;
  bool upWorkButtonHovering = false;

  Widget application = Container(
    height: 575,
    width: 270,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
      color: Colors.cyan.shade100,
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const FlutterLogo(
            size: 100,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.cyan.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              textAlign: TextAlign.center,
              'Select any app from the dropdown menu above!',
              style: GoogleFonts.jetBrainsMono(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    ),
  );

  late AnimationController _offsetController;
  late Animation<Offset> _offsetAnimation;
  Offset _offset = Offset.zero;
  static const double limitParallaxOffset = 350;

  void _runOffsetAnimation() {
    _offsetAnimation = _offsetController.drive(Tween<Offset>(
      begin: _offset,
      end: Offset.zero,
    ));
    _offsetController.reset();
    _offsetController.forward();
  }

  @override
  void initState() {
    super.initState();

    _offsetController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _offsetController.addListener(() {
      setState(() {
        _offset = _offsetAnimation.value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _offsetController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CodeProvider(),
      child: MaterialApp(
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          backgroundColor: const Color(0xff1D1D1F),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double maxWidth = constraints.maxWidth;
              final double maxHeight = constraints.maxHeight;

              // Calculate the scaling factor based on width and height
              final double scaleFactor = (maxWidth < 800 || maxHeight < 800)
                  ? (maxWidth / 800).clamp(0.5, 1.0) *
                      (maxHeight / 800).clamp(0.5, 1.0)
                  : 1.0;

              // Calculate the font size based on the scaling factor
              final double titleFontSize = 90 * scaleFactor;
              final double subtitleFontSize = 25 * scaleFactor;
              final double descriptionFontSize = 15 * scaleFactor;
              final double talkFontSize = 30 * scaleFactor;
              final double codeFontSize = 40 * scaleFactor;

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: maxWidth * 0.05),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: maxHeight * 0.1),
                          Transform(
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001) // perspective
                              ..rotateX(0.001 * _offset.dy) // changed
                              ..rotateY(-0.001 * _offset.dx), // changed
                            alignment: FractionalOffset.center,
                            child: MouseRegion(
                              onEnter: (details) {
                                _offsetController.stop();
                              },
                              onHover: (details) {
                                setState(() {
                                  const Offset(-limitParallaxOffset,
                                                  -limitParallaxOffset) <
                                              _offset &&
                                          _offset <
                                              const Offset(limitParallaxOffset,
                                                  limitParallaxOffset)
                                      ? _offset += details.delta / 2
                                      : _offset = Offset.zero;
                                });
                              },
                              onExit: (details) {
                                _runOffsetAnimation();
                              },
                              child: Container(
                                height: (((maxHeight * 0.6) < 320) &&
                                        (((maxWidth * 0.65) < 640)))
                                    ? 200
                                    : maxHeight * 0.6,
                                width: maxWidth * 0.65,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xff2D2F33),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(1, 1),
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                      ),
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: maxWidth * 0.08,
                                            top: maxHeight * 0.1,
                                            right: maxWidth * 0.05,
                                          ),
                                          child: MouseRegion(
                                            onHover: (event) {
                                              setState(() {
                                                isKaljitHovering = true;
                                              });
                                            },
                                            onExit: (event) {
                                              setState(() {
                                                isKaljitHovering = false;
                                              });
                                            },
                                            child: Text(
                                              'kaljit',
                                              style: GoogleFonts.jetBrainsMono(
                                                textStyle: TextStyle(
                                                  shadows: <Shadow>[
                                                    Shadow(
                                                      offset: Offset(
                                                        isKaljitHovering
                                                            ? 15
                                                            : 5,
                                                        isKaljitHovering
                                                            ? 15
                                                            : 5,
                                                      ),
                                                      blurRadius: 3,
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 0, 0),
                                                    ),
                                                  ],
                                                  fontSize: titleFontSize,
                                                  color: Colors.cyan,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                  height: maxHeight * 0.08),
                                              Text(
                                                'full-stack developer',
                                                style:
                                                    GoogleFonts.jetBrainsMono(
                                                  textStyle: TextStyle(
                                                    fontSize: subtitleFontSize,
                                                    color: Colors.cyan,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                  height: maxHeight * 0.02),
                                              Text(
                                                'android, iOS, web, linux, embedded',
                                                style:
                                                    GoogleFonts.jetBrainsMono(
                                                  textStyle: TextStyle(
                                                    fontSize:
                                                        descriptionFontSize,
                                                    color: Colors.cyan,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: maxHeight * 0.08),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: maxWidth * 0.08),
                                          child: Text(
                                            'talk is cheap, let me show you',
                                            style: GoogleFonts.jetBrainsMono(
                                              textStyle: TextStyle(
                                                fontSize: talkFontSize,
                                                color: Colors.cyan,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Consumer<CodeProvider>(builder:
                                            (context, provider, child) {
                                          return GestureDetector(
                                            onTap: () {
                                              // provider.fetchCode();
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //     builder: (context) {
                                              //       return const TheCodePage();
                                              //     },
                                              //   ),
                                              // );
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: maxWidth * 0.08),
                                              child: MouseRegion(
                                                onHover: (event) {
                                                  setState(() {
                                                    isTheCodeHovering = true;
                                                  });
                                                },
                                                onExit: (event) {
                                                  setState(() {
                                                    isTheCodeHovering = false;
                                                  });
                                                },
                                                child: Text(
                                                  'the code',
                                                  style:
                                                      GoogleFonts.jetBrainsMono(
                                                    textStyle: TextStyle(
                                                      shadows: <Shadow>[
                                                        Shadow(
                                                          offset: Offset(
                                                            isTheCodeHovering
                                                                ? 15
                                                                : 5,
                                                            isTheCodeHovering
                                                                ? 15
                                                                : 5,
                                                          ),
                                                          blurRadius: 2.0,
                                                          color: const Color
                                                                  .fromARGB(
                                                              255, 0, 0, 0),
                                                        ),
                                                      ],
                                                      fontSize: codeFontSize,
                                                      color: Colors.cyan,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: maxHeight * 0.1),
                          SizedBox(
                            height: 80 * scaleFactor,
                            width: maxWidth * 0.65,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    js.context.callMethod('open', [
                                      'https://play.google.com/store/apps/developer?id=Aditya+Dwivedi'
                                    ]);
                                  },
                                  child: MouseRegion(
                                    onEnter: (event) {
                                      setState(() {
                                        playStoreButtonHovering = true;
                                      });
                                    },
                                    onExit: (event) {
                                      setState(() {
                                        playStoreButtonHovering = false;
                                      });
                                    },
                                    child: Material(
                                      color: const Color(0xff1D1D1F),
                                      elevation:
                                          playStoreButtonHovering ? 100 : 10,
                                      shadowColor: Colors.cyan,
                                      child: Container(
                                        height: 80 * scaleFactor,
                                        width: 240 * scaleFactor,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: playStoreButtonHovering
                                              ? Colors.grey.shade700
                                              : Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                'assets/googlePlay.png'),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Get my apps from\nPlayStore',
                                              style: GoogleFonts.jetBrainsMono(
                                                color: Colors.white,
                                                fontSize: 13 * scaleFactor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    js.context.callMethod('open', [
                                      'https://www.linkedin.com/in/aditya-dwivedi-857aa2155/'
                                    ]);
                                  },
                                  child: MouseRegion(
                                    onEnter: (event) {
                                      setState(() {
                                        linkedInButtonHovering = true;
                                      });
                                    },
                                    onExit: (event) {
                                      setState(() {
                                        linkedInButtonHovering = false;
                                      });
                                    },
                                    child: Material(
                                      color: const Color(0xff1D1D1F),
                                      elevation:
                                          linkedInButtonHovering ? 100 : 10,
                                      shadowColor: Colors.cyan,
                                      child: Container(
                                        height: 80 * scaleFactor,
                                        width: 260 * scaleFactor,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: linkedInButtonHovering
                                              ? Colors.grey.shade700
                                              : Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset('assets/linkedIN.png'),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Connect with me on\nLinkedIn',
                                              style: GoogleFonts.jetBrainsMono(
                                                color: Colors.white,
                                                fontSize: 13 * scaleFactor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    js.context.callMethod('open', [
                                      'https://www.upwork.com/freelancers/~01072ee9a454875c10'
                                    ]);
                                  },
                                  child: MouseRegion(
                                    onEnter: (event) {
                                      setState(() {
                                        upWorkButtonHovering = true;
                                      });
                                    },
                                    onExit: (event) {
                                      setState(() {
                                        upWorkButtonHovering = false;
                                      });
                                    },
                                    child: Material(
                                      color: const Color(0xff1D1D1F),
                                      elevation:
                                          upWorkButtonHovering ? 100 : 10,
                                      shadowColor: Colors.cyan,
                                      child: Container(
                                        height: 80 * scaleFactor,
                                        width: 190 * scaleFactor,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: upWorkButtonHovering
                                              ? Colors.grey.shade700
                                              : Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset('assets/upWork.png'),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Hire me on\nUpwork',
                                              style: GoogleFonts.jetBrainsMono(
                                                color: Colors.white,
                                                fontSize: 13 * scaleFactor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 100,
                        top: 15,
                      ),
                      child: SingleChildScrollView(
                        child: Stack(
                          children: [
                            Positioned(
                              child: Column(
                                children: [
                                  DropdownMenuTheme(
                                    data: DropdownMenuThemeData(
                                      inputDecorationTheme:
                                          InputDecorationTheme(
                                        filled: true,
                                        fillColor: Colors.cyan.shade400,
                                        labelStyle: GoogleFonts.jetBrainsMono(
                                          color: Colors.black,
                                        ),
                                        hoverColor: Colors.cyan.shade600,
                                      ),
                                    ),
                                    child: DropdownMenu(
                                      onSelected: (value) {
                                        if (value == 1) {
                                          setState(() {
                                            application = const ChessTimer();
                                          });
                                        }
                                        if (value == 2) {
                                          setState(() {
                                            application =
                                                const ProductivityCompanion();
                                          });
                                        }
                                        if (value == 3) {
                                          setState(() {
                                            application = const GameBoard();
                                          });
                                        }
                                        if (value == 4) {
                                          setState(() {
                                            application =
                                                const FlutterPlayground();
                                          });
                                        }
                                      },
                                      menuStyle: MenuStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
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
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Image.asset(
                                    'assets/iphone_bazel.png',
                                    height: 600,
                                    width: 300,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 80,
                              left: 16,
                              width: 270,
                              height: 575,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: application,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
