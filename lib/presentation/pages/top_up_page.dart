import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/bloc/bloc/page_bloc.dart';
import 'package:movie_app/bloc/bloc/user_bloc.dart';
import 'package:movie_app/presentation/widgets/black_button.dart';
import 'package:movie_app/presentation/widgets/top_up_card.dart';

class TopUpPage extends StatefulWidget {
  TopUpPage({super.key});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  int selectedAmount = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(OpenMainPage());
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
                  height: 50,
                ),
                Text(
                  "Choose the Amount",
                  style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000)),
                ),
                SizedBox(
                  height: 100,
                ),
                Wrap(
                  runSpacing: 8,
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  children: <Widget>[
                    buildTopUpCard(50000),
                    buildTopUpCard(100000),
                    buildTopUpCard(150000),
                    buildTopUpCard(200000),
                    buildTopUpCard(250000),
                    buildTopUpCard(300000),
                    buildTopUpCard(350000),
                    buildTopUpCard(400000),
                    buildTopUpCard(450000)
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                BlackButton(
                    onPressed: () {
                      context.read<UserBloc>().add(TopUp(selectedAmount));
                      context.read<PageBloc>().add(OpenMainPage());
                    },
                    text: "Top Up")
              ],
            )),
          )),
    );
  }

  TopUpCard buildTopUpCard(int amount) {
    return TopUpCard(
        onTap: () {
          if (mounted) {
            setState(() {
              if (selectedAmount != amount) {
                selectedAmount = amount;
              } else {
                selectedAmount = 0;
              }
            });
          }
        },
        isSelected: amount == selectedAmount,
        amount: amount);
  }
}
