import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInput extends StatelessWidget {
  final String text;
  final bool isPassword;

  final TextEditingController controller;
  const TextInput(
      {Key? key,
      required this.text,
      required this.controller,
      required this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: EdgeInsets.fromLTRB(10, 15, 5, 0),
      width: 300,
      height: 50,
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
            hintText: text,
            border: InputBorder.none,
            hintStyle: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xffacaeaf))),
        controller: controller,
        style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xff5F666C)),
      ),
    );
  }
}
