import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/presentation/pages/main_page.dart';
import 'package:movie_app/presentation/widgets/black_button.dart';
import 'package:movie_app/presentation/widgets/text_input.dart';
import 'package:movie_app/repository/auth_services.dart';

import '../../bloc/bloc/movie_bloc.dart';
import '../../bloc/bloc/page_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  TextEditingController fullNameController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  TextEditingController confirmPasswordController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(OpenSplashPage());
        throw (Error);
      },
      child: Scaffold(
        backgroundColor: Color(0xffd4e1f4),
        body: SafeArea(
            child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Text(
                "Create New Account",
                style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000)),
              ),
              SizedBox(
                height: 50,
              ),
              TextInput(
                isPassword: false,
                text: "Full Name",
                controller: fullNameController,
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
                height: 25,
              ),
              TextInput(
                isPassword: true,
                text: "Confirm Password",
                controller: confirmPasswordController,
              ),
              SizedBox(
                height: 45,
              ),
              BlackButton(
                  onPressed: () {
                    try {
                      AuthServices.signUp(fullNameController.text,
                          emailController.text, passwordController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlocProvider(
                                  create: (context) =>
                                      MovieBloc()..add(FetchMovies()),
                                  child: MainPage(),
                                )),
                      );
                    } on FirebaseAuthException catch (e) {
                      _handleSignUpError(e, context);
                    }
                  },
                  text: "Sign Up")
            ],
          ),
        )),
      ),
    );
  }

  void _handleSignUpError(FirebaseAuthException e, BuildContext context) async {
    String messageToDisplay;

    switch (e.code) {
      case 'email-already-in-use':
        messageToDisplay = 'Email already in use';
        break;

      case 'invalid-email':
        messageToDisplay = 'Invalid Email';
        break;

      case 'operation-not-allowed':
        messageToDisplay = "This operation is not allowed";
        break;

      case 'weak-password':
        messageToDisplay = 'Password is too weak';
        break;

      default:
        messageToDisplay = 'Unknown error occured';
        break;
    }

    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Sign Up Failed"),
              content: Text(messageToDisplay),
              actions: [],
            ));
  }
}
