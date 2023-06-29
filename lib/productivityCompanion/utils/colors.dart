import 'package:flutter/material.dart';
import '../widgets/backgroundcolorbutton.dart';

Color backGroundColor = Colors.blueGrey;
Color appBarColor = Colors.blueGrey.shade600;
Color activatedTaskTileColor = Color(0xff4A828F);
Color deActivatedTaskTileColor = Color(0xFFA5C8CA);
Color placeholderWidgetColor = Colors.blueGrey.shade400;
Color slidableColor = Colors.blueGrey.shade300;
Color taskTileBorderColor = Colors.blueGrey.shade600;
Color textColor = Colors.black;
Color iconColor = Colors.black;
Color addTaskButtonShadowColor = Colors.blueGrey.shade600;
Color addTaskButtonBorderColor = Colors.blueGrey.shade700;
Color addTaskButtonIconColor = iconColor;
Color settingsPageTextColor = Colors.black;

List<Widget> generateBackgroundColorButtons(List<dynamic> colors) {
  List<Widget> buttons = [];

  for (int i = 0; i < colors.length; i++) {
    buttons.add(
      BackgroundColorButton(
        color: colors[i],
        index: i,
      ),
    );
  }

  return buttons;
}

