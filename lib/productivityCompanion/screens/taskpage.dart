import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/appbar.dart';
import '../widgets/navigationdrawer.dart';
import '../widgets/textformfield.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: myAppBar(),
        backgroundColor: backGroundColor,
        drawer: MyNavigationDrawer(),
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 5,
                child: Form(
                  child: Column(
                    children: [
                      myTextFormField(
                        index: widget.index,
                        icon: Icons.task_alt,
                        maxLines: 1,
                        flex: 1,
                        labelText: 'Task Name',
                        maxLength: 30,
                      ),
                      myTextFormField(
                        index: widget.index,
                        icon: Icons.category,
                        maxLines: 1,
                        flex: 1,
                        labelText: 'Label/ Category',
                        maxLength: 20,
                      ),
                      myTextFormField(
                        index: widget.index,
                        icon: Icons.notes,
                        maxLines: 20,
                        flex: 5,
                        labelText: 'Notes',
                        maxLength: 2000,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
