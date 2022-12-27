import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/bloc/bloc/page_bloc.dart';
import 'package:movie_app/bloc/bloc/user_bloc.dart';

import '../widgets/genre_button.dart';
import '../widgets/movie_list.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 75,
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoaded) {
                return Container(
                  margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome!" + state.user.fullName,
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff2c3e50)),
                          ),
                          Text(
                            state.user.walletAmount,
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff2c3e50)),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 123),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xff2c3e50))),
                          onPressed: () {
                            context.read<PageBloc>().add(OpenTopUpPage());
                          },
                          child: Text("Top Up"),
                        ),
                        // child: Text(
                        //   "IDR!",
                        //   style: GoogleFonts.poppins(
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.w700,
                        //       color: Color(0xff2c3e50)),
                        // ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Color(0xff2F3943),
            ),
            width: 280,
            height: 35,
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    bottom: 10,
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search",
                  border: InputBorder.none,
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff5F666C))),
              // controller: controller,
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffacaeaf)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Row(
              children: [
                Text(
                  "Category",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff2c3e50)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 116),
                  child: RichText(
                      text: TextSpan(
                    children: [
                      TextSpan(
                        text: "See All>",
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff2c3e50)),
                      )
                    ],
                  )),
                )
              ],
            ),
          ),
          Container(
            // margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
            height: 100,
            child: Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: EdgeInsets.only(
                          left: (index == 0) ? 24 : 0,
                          right: (index == 5 - 1) ? 24 : 16,
                        ),
                        child: Row(
                          children: <Widget>[
                            GenreButton(),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      );
                    })),
          ),
          SizedBox(
            height: 10,
          ),
          MovieList(),
        ],
      ),
    );
  }
}
