import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class TopUpCard extends StatelessWidget {
  final bool isSelected;
  final Function onTap;
  final int amount;

  const TopUpCard(
      {Key? key,
      required this.onTap,
      required this.isSelected,
      required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: isSelected ? Color(0xff2f3980) : Colors.transparent),
            color: Colors.white,
          ),
          width: 100,
          height: 100,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "IDR",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                Text(amount.toString(),
                    textScaleFactor: 1.5,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w800))
              ],
            ),
          )),
    );
  }
}
