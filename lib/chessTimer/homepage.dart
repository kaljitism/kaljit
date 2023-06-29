import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'button.dart';
import 'container.dart';

class ChessTimer extends StatefulWidget {
  const ChessTimer({Key? key}) : super(key: key);

  @override
  State<ChessTimer> createState() => _ChessTimerState();
}

class _ChessTimerState extends State<ChessTimer>
    with SingleTickerProviderStateMixin {
  Color activeColor = Colors.green;
  Color inActiveColor = Colors.grey;

  Color? player1Color;
  Color? player2Color;

  int player1Time = 600;
  int player2Time = 600;

  bool timer1Running = false;
  bool timer2Running = false;

  Timer? player1Timer;
  Timer? player2Timer;

  bool isTimer1Active = false;
  bool isTimer2Active = false;

  bool gamePaused = false;

  late AnimationController _controller;
  late Animation<Decoration> _animation;

  static final colors = [
    ...Colors.primaries,
    ...Colors.accents,
  ].expand((color) => generateShades(color)).toList();
  static Random random = Random();
  Color color1 = colors[random.nextInt(colors.length)];
  Color color2 = colors[random.nextInt(colors.length)];

  static List<Color> generateShades(Color color) {
    final List<Color> shades = [];
    const opacityStep = 0.1;

    for (var opacity = 1.0; opacity >= 0.1; opacity -= opacityStep) {
      final shadedColor = color.withOpacity(opacity);
      shades.add(shadedColor);
    }

    return shades;
  }

  void startPlayer1Timer() {
    if (!isTimer1Active) {
      player1Color = activeColor;
      player1Timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (!mounted) return;
        setState(() {
          timer1Running = true;
          isTimer1Active = true;
          player1Time--;
        });
      });
    } else if (isTimer1Active) {
      setState(() {
        player1Color = inActiveColor;
        isTimer1Active = false;
        timer1Running = false;
        player1Timer?.cancel();
      });
      startPlayer2Timer();
    }
  }

  void startPlayer2Timer() {
    if (!isTimer2Active) {
      player2Color = activeColor;
      player2Timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (!mounted) return;
        setState(() {
          timer2Running = true;
          isTimer2Active = true;
          player2Time--;
        });
      });
    } else if (isTimer2Active) {
      if (!mounted) return;
      setState(() {
        player2Color = inActiveColor;
        isTimer2Active = false;
        timer2Running = false;
        player2Timer?.cancel();
      });
      startPlayer1Timer();
    }
  }

  void pauseGame() {
    setState(() {
      if (gamePaused == false) {
        player1Timer?.cancel();
        player2Timer?.cancel();
      } else {
        timer1Running ? startPlayer1Timer() : startPlayer2Timer();
      }
      gamePaused ? gamePaused = false : gamePaused = true;
    });
  }

  void resetGame() {
    setState(() {
      player1Timer?.cancel();
      player2Timer?.cancel();

      player1Time = 600;
      player2Time = 600;

      timer1Running = false;
      timer2Running = false;

      isTimer1Active = false;
      isTimer2Active = false;
    });
  }

  void updateColors() {
    setState(() {
      final random = Random();
      color1 = colors[random.nextInt(
          colors.length)]; // Update with your desired logic for color selection
      color2 = colors[random.nextInt(
          colors.length)]; // Update with your desired logic for color selection
    });
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          updateColors();
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          updateColors();
          _controller.forward();
        }
      })
      ..addListener(() {
        setState(() {
          updateColors();
        });
      });

    _animation = DecorationTween(
      begin: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      end: BoxDecoration(
        gradient: LinearGradient(
          colors: [color2, color1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            decoration: _animation.value,
            child: child,
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: GestureDetector(
                  onTap: () {
                    updateColors();
                    if (gamePaused == false) {
                      !timer2Running ? startPlayer1Timer() : '';
                    }
                  },
                  child: MyContainer(
                    color: player1Color,
                    timerText: player1Time.toString(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                    function: pauseGame,
                  ),
                  GestureDetector(
                    onTap: resetGame,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.restart_alt,
                        size: 35,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: GestureDetector(
                  onTap: () {
                    updateColors();
                    if (gamePaused == false) {
                      !timer1Running ? startPlayer2Timer() : '';
                    }
                  },
                  child: MyContainer(
                    color: player2Color,
                    timerText: player2Time.toString(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
