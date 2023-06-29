import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/homepageProvider.dart';
import '../screens/taskpage.dart';
import 'customInnerTaskTile.dart';

class OuterTaskTile extends StatefulWidget {
  final int serialNumber;

  const OuterTaskTile({super.key, required this.serialNumber});

  @override
  State<OuterTaskTile> createState() => _OuterTaskTileState();
}

class _OuterTaskTileState extends State<OuterTaskTile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, provider, child) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (DismissDirection direction) {
            provider.onDismissed(widget.serialNumber);
          },
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      TaskPage(index: widget.serialNumber),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return Transform(
                      transform: Matrix4.identity()
                        ..translate(0.0, (1.0 - animation.value) * 1000.0)
                        ..scale(animation.value),
                      alignment: Alignment.center,
                      child: Opacity(
                        opacity: animation.value,
                        child: child,
                      ),
                    );
                  },
                ),
              );
            },
            child: CustomInnerTaskTile(
              serialNumber: widget.serialNumber,
            ),
          ),
        );
      },
    );
  }
}
