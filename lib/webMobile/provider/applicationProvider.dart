import 'package:flutter/material.dart';

import '../../chessTimer/homepage.dart';
import '../../flutterPlayground/main.dart';
import '../../productivityCompanion/main.dart';
import '../../tetris/board.dart';

class ApplicationProvider extends ChangeNotifier {
  Widget? _application;
  Widget? get application => _application;

  void onMenuItemSelection(value) {
    if (value == 1) {
      _application = const ChessTimer();
      notifyListeners();
    } else if (value == 2) {
      _application = const ProductivityCompanion();
      notifyListeners();
    } else if (value == 3) {
      _application = const GameBoard();
      notifyListeners();
    } else if (value == 4) {
      _application = const FlutterPlayground();
      notifyListeners();
    }
  }
}
