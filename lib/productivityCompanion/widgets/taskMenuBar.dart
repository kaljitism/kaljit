import 'package:flutter/material.dart';

class TaskMenuBar extends StatefulWidget {
  const TaskMenuBar({Key? key}) : super(key: key);

  @override
  State<TaskMenuBar> createState() => _TaskMenuBarState();
}

class _TaskMenuBarState extends State<TaskMenuBar> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        const PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.add),
            title: Text('Item 1'),
          ),
        ),
        const PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.anchor),
            title: Text('Item 2'),
          ),
        ),
        const PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.article),
            title: Text('Item 3'),
          ),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem(child: Text('Item A')),
        const PopupMenuItem(child: Text('Item B')),
      ],
    );
  }
}
