import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/homepageProvider.dart';
import '../utils/colors.dart';
import '../widgets/appbar.dart';
import '../widgets/navigationdrawer.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: myAppBar(),
        backgroundColor: backGroundColor,
        drawer: MyNavigationDrawer(),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: ListView(
            scrollDirection: Axis.vertical,
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Text(
                'Asynchronicity',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Consumer<HomePageProvider>(
                builder: (context, provider, child) {
                  return CheckboxListTile(
                    checkColor: Colors.lightBlue,
                    activeColor: Color(0xffffffff),
                    tileColor: Colors.grey.shade400,
                    title: Text(
                      'Run multiple tasks at any time',
                      style: TextStyle(
                        fontSize: 18,
                        color: settingsPageTextColor,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    value: provider.synchronicity,
                    onChanged: (bool? value) {
                      setState(() {
                        provider.synchronicity = value!;
                      });
                    },
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 2,
                color: textColor,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Theme Customization',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Background',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Consumer<HomePageProvider>(builder: (context, value, child) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: generateBackgroundColorButtons(value.colors),
                  ),
                );
              }),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 2,
                color: textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
