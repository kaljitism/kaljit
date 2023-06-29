import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final String? timerText;
  final Color? color;

  const MyContainer({super.key, required this.timerText, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.1),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10.0,
              spreadRadius: 1,
              offset: Offset(3, 3),
            ),
          ],
        ),
        child: Center(
          child: RotatedBox(
            quarterTurns: 135,
            child: Text(
              timerText!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
