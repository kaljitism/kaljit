import 'package:flutter/material.dart';
import 'package:kaljit/productivityCompanion/provider/homepageProvider.dart';
import 'package:kaljit/productivityCompanion/screens/homepage.dart';
import 'package:kaljit/productivityCompanion/screens/settings.dart';
import 'package:kaljit/productivityCompanion/utils/appbuilder.dart';
import 'package:kaljit/productivityCompanion/utils/colors.dart';
import 'package:provider/provider.dart';

class ProductivityCompanion extends StatelessWidget {
  const ProductivityCompanion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return HomePageProvider();
      },
      child: AppBuilder(
        builder: (context) {
          return MaterialApp(
            color: backGroundColor,
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
            routes: {
              '/settings': (context) => const Settings(),
            },
          );
        },
      ),
    );
  }
}
