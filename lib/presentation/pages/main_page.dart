import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/bloc/bloc/movie_bloc.dart';
import 'package:movie_app/presentation/widgets/black_button.dart';
import 'package:movie_app/presentation/widgets/movie_card.dart';
import 'package:movie_app/presentation/widgets/movie_list.dart';

import '../../entities/movie.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffd4e1f4),
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 75,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome!",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff2c3e50)),
                          ),
                          Text(
                            "IDR 77.777",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff2c3e50)),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 150),
                        child: Text(
                          "IDR!",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff2c3e50)),
                        ),
                      ),
                    ],
                  ),
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
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  height: 100,
                  child: Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (_, index) {
                            return Row(
                              children: <Widget>[
                                Container(
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
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            // side: BorderSide(color: Colors.red)
                                          )),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                            Color(0xff2c3e50),
                                          ))),
                                ),
                                SizedBox(
                                  width: 20,
                                )
                              ],
                            );
                          })),
                ),
                SizedBox(
                  height: 20,
                ),
                MovieList()
              ],
            ),
          ),
        ));
  }
}
