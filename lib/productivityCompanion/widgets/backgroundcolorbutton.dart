import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/homepageProvider.dart';
import '../utils/appbuilder.dart';
import '../utils/colors.dart';

class BackgroundColorButton extends StatefulWidget {
  const BackgroundColorButton({
    super.key,
    required this.color,
    required this.index,
  });

  final Color color;
  final int index;

  @override
  State<BackgroundColorButton> createState() => _BackgroundColorButtonState();
}

class _BackgroundColorButtonState extends State<BackgroundColorButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<HomePageProvider>(
        builder: (context, value, child) {
          return GestureDetector(
            onTap: () {
              setState(() {
                print(backGroundColor);
                backGroundColor = value.colors[widget.index][600];
                appBarColor = value.colors[widget.index][700];
                activatedTaskTileColor = value.colors[widget.index][700];
                deActivatedTaskTileColor = value.colors[widget.index][500];
                placeholderWidgetColor = value.colors[widget.index][400];
                slidableColor = value.colors[widget.index][300];
                taskTileBorderColor = value.colors[widget.index][600];
                addTaskButtonShadowColor = value.colors[widget.index][600];
                addTaskButtonBorderColor = value.colors[widget.index][800];
                value.preventTextCamouflage();
                AppBuilder.of(context)?.rebuild();
              });
            },


            child: Container(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: widget.color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: textColor,
                        width: 5,
                      )
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
