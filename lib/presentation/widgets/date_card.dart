import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/extensions/date_time_extension.dart';

class DateCard extends StatelessWidget {
  final bool isSelected;
  final double width;
  final double height;
  final DateTime date;
  final Function onTap;

  DateCard(
    this.date, {
    this.isSelected = false,
    this.width = 70,
    this.height = 90,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isSelected ? Color(0xff2c3e50) : Colors.transparent,
          border: Border.all(
            color: isSelected ? Colors.transparent : Color(0xFFE4E4E4),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              style: (GoogleFonts.raleway().copyWith(
                color: (isSelected) ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              )).copyWith(fontSize: 16),
              date.shortDayName,
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              style: (GoogleFonts.raleway().copyWith(
                color: (isSelected) ? Colors.white : Colors.black,
                fontWeight: FontWeight.w800,
              )).copyWith(fontSize: 16),
              date.day.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
