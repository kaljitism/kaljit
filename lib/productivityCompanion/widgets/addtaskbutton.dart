import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../provider/homepageProvider.dart';
import '../utils/colors.dart';

class AddTaskButton extends StatefulWidget {
  const AddTaskButton({
    super.key,
  });

  @override
  State<AddTaskButton> createState() => _AddTaskButtonState();
}

class _AddTaskButtonState extends State<AddTaskButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(builder: (context, provider, child) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: provider.addTask,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: addTaskButtonBorderColor,
                ),
                color: addTaskButtonShadowColor,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 60,
                  color: addTaskButtonIconColor,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
