import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
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

  void updateColors() {
    final random = Random();
    color1 = colors[random.nextInt(
        colors.length)]; // Update with your desired logic for color selection
    color2 = colors[random.nextInt(
        colors.length)]; // Update with your desired logic for color selection
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..addStatusListener((status) {
        setState(() {
          updateColors();
        });
        if (status == AnimationStatus.completed) {
          setState(() {
            updateColors();
          });
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          setState(() {
            updateColors();
          });
          _controller.forward();
        }
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

    _controller.addListener(() {
      setState(() {
        // Rebuild the widget when the animation value changes
      });
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        updateColors(); // Update colors when animation completes
        _controller.reverse(); // Reverse the animation
      } else if (status == AnimationStatus.dismissed) {
        updateColors(); // Update colors when animation starts from the beginning
        _controller.forward(); // Forward the animation
      }
    });

    _controller.forward(); // Start the animation
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
        child: Container(),
      ),
    );
  }
}
