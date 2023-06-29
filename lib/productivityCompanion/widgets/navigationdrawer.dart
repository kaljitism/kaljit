import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/homepage.dart';
import '../utils/colors.dart';

class MyNavigationDrawer extends StatelessWidget {
  const MyNavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backGroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: ListView(
        children: [
          Container(
            height: 200,
            child: Center(
              child: Text('Serenity',
                  style: GoogleFonts.merienda(
                    textStyle: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  )),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomePage();
                  },
                ),
              );
            },
            leading: Icon(
              Icons.home_filled,
              color: iconColor,
              size: 35,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 23,
                color: textColor,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
            leading: Icon(
              Icons.settings,
              color: iconColor,
              size: 40,
            ),
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 23,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
