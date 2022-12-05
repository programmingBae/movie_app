import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/presentation/widgets/black_button.dart';
import 'package:movie_app/repository/auth_services.dart';
import 'package:provider/provider.dart';

import '../../bloc/bloc/page_bloc.dart';
import '../widgets/text_input.dart';

import '../../bloc/bloc/movie_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(OpenSplashPage());
        throw (Error);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffd4e1f4),
        body: SafeArea(
            child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Image(
                image: AssetImage('assets/3d.png'),
                width: 300,
                height: 180,
              ),
              Text(
                "Welcome back! :D",
                style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000)),
              ),
              SizedBox(
                height: 25,
              ),
              TextInput(
                isPassword: false,
                text: "Email",
                controller: emailController,
              ),
              SizedBox(
                height: 25,
              ),
              TextInput(
                isPassword: true,
                text: "Password",
                controller: passwordController,
              ),
              SizedBox(
                height: 30,
              ),
              BlackButton(
                  onPressed: () async {
                    try {
                      await AuthServices.signIn(
                          emailController.text, passwordController.text);
                    } on Exception catch (e) {
                      // TODO
                    }
                  },
                  text: "Sign In")
            ],
          ),
        )),
      ),
    );
  }
}
