import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectableBox extends StatelessWidget {
  final bool isSelected;
  final bool isEnabled;
  final double width;
  final double height;
  final String text;
  final Function? onTap;

  SelectableBox(
    this.text, {
    this.isSelected = false,
    this.isEnabled = true,
    this.width = 144,
    this.height = 60,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: (!isEnabled)
              ? Color(0xFFE4E4E4)
              : isSelected
                  ? Color(0xff2c3e50)
                  : Colors.transparent,
          border: Border.all(
            color: (!isEnabled)
                ? Color(0xFFE4E4E4)
                : isSelected
                    ? Colors.transparent
                    : Color(0xFFE4E4E4),
          ),
        ),
        child: Center(
          child: Text(
            text ?? "None",
            style: (GoogleFonts.raleway().copyWith(
              color: (isSelected && isEnabled) ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
            )).copyWith(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
