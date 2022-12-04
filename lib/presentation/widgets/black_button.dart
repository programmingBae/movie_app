import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class BlackButton extends StatelessWidget {
  final VoidCallback onPressed;

  final String text;

  const BlackButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);
  // const BlackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 250,
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                // side: BorderSide(color: Colors.red)
              )),
              backgroundColor: MaterialStateProperty.all<Color>(
                Color(0xff2f3980),
              ))),
    );
  }
}
