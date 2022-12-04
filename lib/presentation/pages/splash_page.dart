import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/presentation/pages/sign_in_page.dart';
import 'package:movie_app/presentation/pages/sign_up_page.dart';

import '../widgets/black_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd4e1f4),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Image(
                image: AssetImage('assets/ticket.png'),
                width: 300,
                height: 180,
              ),
              Text(
                "BlueTicks",
                style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000)),
              ),
              Text(
                "Book your favorite movies\neverywhere and everytime",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff2c3e50)),
              ),
              SizedBox(
                height: 100,
              ),
              BlackButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                text: "Get Started",
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Sign In",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()),
                          );
                        },
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff428dff)),
                    )
                  ],
                  text: "Already have an account? ",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2c3e50)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
