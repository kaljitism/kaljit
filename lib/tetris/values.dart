import 'package:flutter/material.dart';

// Grid Dimensions
int rowLength = 10;
int columnLength = 16;

// Movement Direction
enum Direction {
  left,
  right,
  down,
}

// Tetrominos
enum Tetromino { L, J, I, O, S, Z, T, empty }

const Map<Tetromino, Color> tetrominoColors = {
  Tetromino.L: Colors.orange,
  Tetromino.J: Colors.blue,
  Tetromino.I: Colors.pink,
  Tetromino.O: Colors.yellow,
  Tetromino.S: Colors.green,
  Tetromino.Z: Colors.red,
  Tetromino.T: Colors.purple,
};
