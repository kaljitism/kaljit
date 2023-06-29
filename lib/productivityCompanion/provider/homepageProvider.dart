import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class HomePageProvider extends ChangeNotifier {
  int _itemCount = 1;
  int get itemCount => _itemCount;

  List<bool> _isSelected = List.filled(1000, false, growable: true).toList();
  List get isSelected => _isSelected;

  List<Timer?> _timer = List.filled(1000, null, growable: true);
  List get timer => _timer;

  List<int> _seconds = List.filled(1000, 0, growable: true).toList();
  List get seconds => _seconds;

  List<String> _leading = List.filled(1000, 'Task', growable: true).toList();
  List get leading => _leading;

  List<String> _subTitle =
      List.filled(1000, 'Label/Category', growable: true).toList();
  List get subTitle => _subTitle;

  List<String> _notes = List.filled(1000, ' ', growable: true).toList();
  List get notes => _notes;

  bool synchronicity = false;

  static MaterialColor myBlack = const MaterialColor(
    0xFF000000,
    <int, Color>{
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(0xFF000000),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );

  static MaterialColor myWhite = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );

  List<Color> _colors = [
    myBlack,
    myWhite,
    Colors.blueGrey,
    Colors.grey,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
  ];
  List get colors => _colors;

  void startTimer(int index) {
    _timer[index] = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_isSelected[index]) {
        _seconds[index]++;
      } else {
        _timer[index]?.cancel();
        _timer[index] = null;
      }
      notifyListeners();
    });
  }

  void stopTimer(int index) {
    _timer[index]?.cancel();
    _timer[index] = null;
    notifyListeners();
  }

  String formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  void unselectOtherTiles(int index) {
    int count = 0;
    for (bool item in _isSelected) {
      if (index != count) {
        if (item) {
          _isSelected[count] = false;
          _timer[count]?.cancel();
          _timer[count] = null;
          notifyListeners();
        }
      }
      count++;
      notifyListeners();
    }
  }

  void onTap(int index) {
    _isSelected[index] = !_isSelected[index];
    _isSelected[index] ? startTimer(index) : stopTimer(index);
    synchronicity ? '' : unselectOtherTiles(index);
    notifyListeners();
  }

  void onDismissed(int index) {
    _isSelected.removeAt(index);
    stopTimer(index);
    _seconds.removeAt(index);
    _leading.removeAt(index);
    _subTitle.removeAt(index);
    _notes.removeAt(index);
    _itemCount--;
    notifyListeners();
  }

  void addTask() {
    _itemCount++;
    notifyListeners();
  }

  void getTaskName(String? value, int index) {
    _leading[index] = value!;
    notifyListeners();
  }

  void getCategoryName(String? value, int index) {
    _subTitle[index] = value!;
    notifyListeners();
  }

  void getNotes(String? value, int index) {
    _subTitle[index] = value!;
    notifyListeners();
  }

  void manageTimersAfterDrag(int beforeIndex, int afterIndex) {
    stopTimer(beforeIndex);
    _timer[afterIndex]?.cancel();
    startTimer(afterIndex);
    notifyListeners();
  }

  void onDragCompletionSwap(int beforeIndex, int afterIndex) {
    _leading.swap(beforeIndex, afterIndex);
    _isSelected.swap(beforeIndex, afterIndex);
    _timer.swap(beforeIndex, afterIndex);
    manageTimersAfterDrag(beforeIndex, afterIndex);
    _seconds.swap(beforeIndex, afterIndex);
    _subTitle.swap(beforeIndex, afterIndex);
    _notes.swap(beforeIndex, afterIndex);
    notifyListeners();
  }

  void preventTextCamouflage() {
    if (backGroundColor == Color(0xff000000)) {
      activatedTaskTileColor = Colors.grey[900]!;
      deActivatedTaskTileColor = Colors.grey[700]!;
      placeholderWidgetColor = Colors.grey[600]!;
      slidableColor = Colors.grey[500]!;
      taskTileBorderColor = Colors.grey[800]!;
      textColor = Colors.white;
      iconColor = Colors.white;
      addTaskButtonShadowColor = Colors.white;
      addTaskButtonIconColor = Colors.black;
      notifyListeners();
      return;
    } else if (backGroundColor == Color(0xffffffff)) {
      appBarColor = Colors.blueGrey.shade400;
      activatedTaskTileColor = Color(0xff4A828F);
      deActivatedTaskTileColor = Color(0xFFA5C8CA);
      placeholderWidgetColor = Colors.blueGrey.shade400;
      slidableColor = Colors.blueGrey.shade300;
      taskTileBorderColor = Colors.blueGrey.shade600;
      textColor = Colors.black;
      iconColor = Colors.black;
      addTaskButtonShadowColor = Color(0xFFA5C8CA);
      addTaskButtonIconColor = Colors.black;
      notifyListeners();
    } else {
      textColor = Colors.black;
      iconColor = Colors.black;
      notifyListeners();
      return;
    }
  }
}
