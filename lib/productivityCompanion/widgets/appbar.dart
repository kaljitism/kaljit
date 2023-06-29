import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

PreferredSize myAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(75),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: iconColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        title: Text(
          'Serenity',
          style: GoogleFonts.merienda(
              textStyle: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          )),
        ),
        backgroundColor: appBarColor,
        elevation: 0,
      ),
    ),
  );
}
