import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class GenreButton extends StatelessWidget {
  const GenreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 100,
      child: ElevatedButton(
          onPressed: () {},
          child: Text(
            "test",
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
                Color(0xff2c3e50),
              ))),
    );
  }
}
