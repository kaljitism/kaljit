import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/homepageProvider.dart';
import '../screens/taskpage.dart';
import '../utils/colors.dart';

class MyPopUpMenu extends StatefulWidget {
  const MyPopUpMenu({super.key, required this.serialNumber});

  final int serialNumber;

  @override
  State<MyPopUpMenu> createState() => _MyPopUpMenuState();
}

class _MyPopUpMenuState extends State<MyPopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(popupMenuTheme: PopupMenuThemeData(color: Colors.white)),
      child: PopupMenuButton<int>(
        icon: Icon(
          Icons.more_vert,
          color: iconColor,
        ),
        itemBuilder: (context) => [
          // popupmenu item 1
          PopupMenuItem(
            value: 1,
            // row has two child icon and text.
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TaskPage(index: widget.serialNumber);
                    },
                  ),
                );
              },
              child: Container(
                width: double.maxFinite,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Icon(Icons.pages_outlined),
                      SizedBox(
                        // sized box with width 10
                        width: 10,
                      ),
                      Text("Task Page")
                    ],
                  ),
                ),
              ),
            ),
          ),
          PopupMenuItem(
            value: 2,
            // row has two child icon and text.
            child:
                Consumer<HomePageProvider>(builder: (context, provider, child) {
              return GestureDetector(
                onTap: () {
                  provider.isSelected[widget.serialNumber] = false;
                  provider.stopTimer(widget.serialNumber);
                  provider.timer[widget.serialNumber] = null;
                  provider.seconds[widget.serialNumber] = 0;
                  provider.leading[widget.serialNumber] = 'Task';
                  provider.subTitle[widget.serialNumber] = 'Label/ Category';
                  provider.notes[widget.serialNumber] = ' ';
                },
                child: Container(
                  width: double.maxFinite,
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Icon(Icons.rotate_left_outlined),
                        SizedBox(
                          // sized box with width 10
                          width: 10,
                        ),
                        Text("Reload")
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
        color: Colors.black,
        iconSize: 30,
        elevation: 2,
      ),
    );
  }
}
