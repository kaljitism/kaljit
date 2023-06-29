import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final VoidCallback function;

  const MyButton({super.key, required this.function});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  IconData? _icon = Icons.pause;

  void updateIcon() {
    setState(() {
      if (_icon == Icons.pause) {
        _icon = Icons.play_arrow;
      } else {
        _icon = Icons.pause;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        updateIcon();
        widget.function();
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Icon(
          _icon,
          size: 30.0,
        ),
      ),
    );
  }
}
