import 'package:flutter/material.dart';
import '../screens/containerSize.dart';
import '../screens/paddingndmargin.dart';

class MyNavigationDrawer extends StatelessWidget {
  const MyNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  FlutterLogo(size: 100),
                  Text(
                    'Flutter\nPlayground',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ContainerSize()),
                );
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              tileColor: Colors.blueGrey.shade100,
              title: const Text(
                'Play with Container Size',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PaddingAndMargin()),
                );
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              tileColor: Colors.blueGrey.shade100,
              title: const Text(
                'Padding and Margin',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              tileColor: Colors.blueGrey.shade100,
              title: const Text(
                'Play with Container Size',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              tileColor: Colors.blueGrey.shade100,
              title: const Text(
                'Play with Container Size',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              tileColor: Colors.blueGrey.shade100,
              title: const Text(
                'Play with Container Size',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              tileColor: Colors.blueGrey.shade100,
              title: const Text(
                'Play with Container Size',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              tileColor: Colors.blueGrey.shade100,
              title: const Text(
                'Play with Container Size',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              tileColor: Colors.blueGrey.shade100,
              title: const Text(
                'Play with Container Size',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              tileColor: Colors.blueGrey.shade100,
              title: const Text(
                'Play with Container Size',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
