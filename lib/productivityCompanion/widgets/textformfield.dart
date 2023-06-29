import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/homepageProvider.dart';
import '../utils/colors.dart';

class myTextFormField extends StatefulWidget {
  const myTextFormField({
    super.key,
    required this.index,
    required this.icon,
    required this.maxLines,
    required this.flex,
    required this.labelText,
    required this.maxLength,
  });

  final int index;
  final IconData icon;
  final int maxLines;
  final int flex;
  final String labelText;
  final int maxLength;

  @override
  State<myTextFormField> createState() => _myTextFormFieldState();
}

class _myTextFormFieldState extends State<myTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, provider, child) {
        return Expanded(
          flex: widget.flex,
          child: TextFormField(
            style: TextStyle(
              color: textColor,
            ),
            maxLength: widget.maxLength,
            maxLines: widget.maxLines,
            decoration: InputDecoration(
                icon: Icon(
                  widget.icon,
                  color: textColor,
                  size: 30,
                ),
                labelStyle: TextStyle(color: textColor),
                label: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.labelText,
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never),
            onChanged: (String? value) {
              if (widget.labelText == 'Task Name') {
                provider.getTaskName(value, widget.index);
              } else if (widget.labelText == 'Label/ Category') {
                provider.getCategoryName(value, widget.index);
              } else if (widget.labelText == 'Notes') {
                provider.getNotes(value, widget.index);
              }
            },
          ),
        );
      },
    );
  }
}
