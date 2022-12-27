import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/bloc/bloc/movie_bloc.dart';
import 'package:movie_app/bloc/bloc/user_bloc.dart';
import 'package:movie_app/presentation/pages/movie_page.dart';
import 'package:movie_app/presentation/pages/ticket_page.dart';
import 'package:movie_app/presentation/widgets/black_button.dart';
import 'package:movie_app/presentation/widgets/genre_button.dart';
import 'package:movie_app/presentation/widgets/movie_card.dart';
import 'package:movie_app/presentation/widgets/movie_list.dart';

import '../../bloc/bloc/page_bloc.dart';
import '../../entities/movie.dart';

class MainPage extends StatefulWidget {
  final int bottomNavBarIndex;
  final bool isExpired;
  const MainPage({this.bottomNavBarIndex = 0, this.isExpired = false});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int bottomNavBarIndex;
  late PageController pageController;

  @override
  void initState() {
    super.initState();

    bottomNavBarIndex = widget.bottomNavBarIndex;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomNavigationBar: createCustomBottomNavBar(),
        backgroundColor: Color(0xffd4e1f4),
        body: Stack(
          children: [
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserLoaded) {
                  return SafeArea(
                    child: Container(
                      child: PageView(
                          controller: pageController,
                          onPageChanged: (index) {
                            setState(() {
                              bottomNavBarIndex = index;
                            });
                          },
                          children: [MoviePage(), Container(), TicketPage()]),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            createCustomBottomNavBar(),
          ],
        ));
  }

  Widget createCustomBottomNavBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipPath(
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xff2c3e50),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            selectedItemColor: Color(0xFF503E9D),
            unselectedItemColor: Color(0xFFE5E5E5),
            currentIndex: bottomNavBarIndex,
            onTap: (index) {
              setState(() {
                bottomNavBarIndex = index;
                pageController.jumpToPage(index);
              });
            },
            items: [
              BottomNavigationBarItem(
                label: "New Movies",
                icon: Container(
                  margin: EdgeInsets.only(bottom: 6),
                  height: 20,
                  // child: Image.asset(
                  //   (bottomNavBarIndex == 0)
                  //       ? "assets/ic_movies.png"
                  //       : "assets/ic_movies_grey.png",
                  // ),
                ),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon: Container(
                  margin: EdgeInsets.only(bottom: 6),
                  height: 20,
                  // child: Image.asset(
                  //   (bottomNavBarIndex == 0)
                  //       ? "assets/ic_movies.png"
                  //       : "assets/ic_movies_grey.png",
                  // ),
                ),
              ),
              BottomNavigationBarItem(
                label: "My Tickets",
                icon: Container(
                  margin: EdgeInsets.only(bottom: 6),
                  height: 20,
                  // child: Image.asset(
                  //   (bottomNavBarIndex == 1)
                  //       ? "assets/ic_tickets.png"
                  //       : "assets/ic_tickets_grey.png",
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class BottomNavBarClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();

//     path.lineTo(size.width / 2 - 28, 0);
//     path.quadraticBezierTo(size.width / 2 - 28, 33, size.width / 2, 33);
//     path.quadraticBezierTo(size.width / 2 + 28, 33, size.width / 2 + 28, 0);
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
