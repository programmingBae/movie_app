import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/bloc/bloc/page_bloc.dart';
import 'package:movie_app/bloc/bloc/ticket_bloc.dart';
import 'package:movie_app/bloc/bloc/ticket_event.dart';
import 'package:movie_app/bloc/bloc/user_bloc.dart';
import 'package:movie_app/entities/ticket.dart';
import 'package:movie_app/entities/user.dart';
import 'package:movie_app/extensions/date_time_extension.dart';

class CheckoutPage extends StatefulWidget {
  final Ticket ticket;

  const CheckoutPage(this.ticket);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    int total = 50000 * widget.ticket.seats!.length;

    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(OpenSelectSeatPage(widget.ticket));
        throw Error();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Color(0xffd4e1f4),
            ),
            SafeArea(
              child: Container(
                color: Color(0xffd4e1f4),
                child: ListView(
                  children: [
                    Stack(
                      children: [
                        // Row(
                        //   children: [
                        //     Container(
                        //       margin: EdgeInsets.only(
                        //         left: 24,
                        //         top: 36,
                        //       ),
                        //       padding: EdgeInsets.all(1),
                        //       child: GestureDetector(
                        //         onTap: () {
                        //           context
                        //               .read<PageBloc>()
                        //               .add(OpenSelectSeatPage(widget.ticket));
                        //         },
                        //         child: Icon(
                        //           Icons.arrow_back,
                        //           color: Colors.black,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        BlocBuilder<UserBloc, UserState>(
                          builder: (_, userState) {
                            User user = (userState as UserLoaded).user;

                            return Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    "Checkout\nMovie",
                                    textAlign: TextAlign.center,
                                    // style: blackTextFont.copyWith(
                                    //   fontSize: 20,
                                    //   height: 1.4,
                                    // ),
                                  ),
                                ),
                                // Row(
                                //   children: [
                                //     Container(
                                //       width: 70,
                                //       height: 90,
                                //       margin: EdgeInsets.only(
                                //         left: 24,
                                //         right: 20,
                                //       ),
                                //       decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(8),
                                //         image: DecorationImage(
                                //           image: NetworkImage(
                                //             "https://image.tmdb.org/t/p/" +
                                //                 'w342' +
                                //                 widget.ticket.movie.posterPath,
                                //           ),
                                //           fit: BoxFit.cover,
                                //         ),
                                //       ),
                                //     ),
                                //     Column(
                                //       crossAxisAlignment:
                                //           CrossAxisAlignment.start,
                                //       children: [
                                //         SizedBox(
                                //           width: MediaQuery.of(context)
                                //                   .size
                                //                   .width -
                                //               2 * 24 -
                                //               70 -
                                //               20,
                                //           child: Text(
                                //             widget.ticket.movie.title,
                                //             maxLines: 2,
                                //             overflow: TextOverflow.clip,
                                //             // style: blackTextFont.copyWith(
                                //             //     fontSize: 18),
                                //           ),
                                //         ),
                                //         // Container(
                                //         //   margin:
                                //         //       EdgeInsets.symmetric(vertical: 6),
                                //         //   width: MediaQuery.of(context)
                                //         //           .size
                                //         //           .width -
                                //         //       2 * 24 -
                                //         //       70 -
                                //         //       20,
                                //         //   child: Text(
                                //         //     widget.ticket.movie
                                //         //         .genresAndLanguage,
                                //         //     style: greyTextFont.copyWith(
                                //         //       fontSize: 12,
                                //         //       fontWeight: FontWeight.normal,
                                //         //     ),
                                //         //   ),
                                //         // ),
                                //         RatingBar.builder(
                                //             initialRating: widget
                                //                     .ticket.movie.voteAverage
                                //                     .toDouble() /
                                //                 2,
                                //             minRating: 1,
                                //             direction: Axis.horizontal,
                                //             allowHalfRating: true,
                                //             ignoreGestures: true,
                                //             itemCount: 5,
                                //             itemSize: 20,
                                //             unratedColor: Colors.white,
                                //             itemPadding:
                                //                 const EdgeInsets.symmetric(
                                //                     horizontal: 4.0),
                                //             itemBuilder: ((context, index) {
                                //               return const Icon(
                                //                 Icons.star,
                                //                 color: Colors.amber,
                                //               );
                                //             }),
                                //             onRatingUpdate: (rating) {}),
                                //       ],
                                //     ),
                                //   ],
                                // ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 24,
                                  ),
                                  child: Divider(
                                    color: Color(0xFFE4E4E4),
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Order ID",
                                        // style: greyTextFont.copyWith(
                                        //   fontSize: 16,
                                        //   fontWeight: FontWeight.w400,
                                        // ),
                                      ),
                                      Text(
                                        widget.ticket.bookingCode,
                                        // style: whiteNumberFont.copyWith(
                                        //   color: Colors.black,
                                        //   fontSize: 16,
                                        //   fontWeight: FontWeight.w400,
                                        // ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Cinema",
                                        // style: greyTextFont.copyWith(
                                        //   fontSize: 16,
                                        //   fontWeight: FontWeight.w400,
                                        // ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.55,
                                        child: Text(
                                          widget.ticket.theater.name,
                                          textAlign: TextAlign.end,
                                          // style: whiteNumberFont.copyWith(
                                          //   color: Colors.black,
                                          //   fontSize: 16,
                                          //   fontWeight: FontWeight.w400,
                                          // ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Date & Time",
                                        // style: greyTextFont.copyWith(
                                        //   fontSize: 16,
                                        //   fontWeight: FontWeight.w400,
                                        // ),
                                      ),
                                      Text(
                                        widget.ticket.time.dateAndtime,
                                        // style: whiteNumberFont.copyWith(
                                        //   color: Colors.black,
                                        //   fontSize: 16,
                                        //   fontWeight: FontWeight.w400,
                                        // ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Seat Number",
                                        // style: greyTextFont.copyWith(
                                        //   fontSize: 16,
                                        //   fontWeight: FontWeight.w400,
                                        // ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.55,
                                        child: Text(
                                          widget.ticket.seatsInString,
                                          textAlign: TextAlign.end,
                                          // style: whiteNumberFont.copyWith(
                                          //   color: Colors.black,
                                          //   fontSize: 16,
                                          //   fontWeight: FontWeight.w400,
                                          // ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Price",
                                        // style: greyTextFont.copyWith(
                                        //   fontSize: 16,
                                        //   fontWeight: FontWeight.w400,
                                        // ),
                                      ),
                                      Text(
                                        "IDR 50.000 x ${widget.ticket.seats!.length}",
                                        // style: whiteNumberFont.copyWith(
                                        //   color: Colors.black,
                                        //   fontSize: 16,
                                        //   fontWeight: FontWeight.w400,
                                        // ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 9,
                                ),

                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total",
                                        // style: greyTextFont.copyWith(
                                        //   fontSize: 16,
                                        //   fontWeight: FontWeight.w400,
                                        // ),
                                      ),
                                      Text(
                                        NumberFormat.currency(
                                          locale: 'id_ID',
                                          decimalDigits: 0,
                                          symbol: 'IDR ',
                                        ).format(total),
                                        // style: whiteNumberFont.copyWith(
                                        //   color: Colors.black,
                                        //   fontSize: 16,
                                        //   fontWeight: FontWeight.w600,
                                        // ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 24,
                                  ),
                                  child: Divider(
                                    color: Color(0xFFE4E4E4),
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Your Wallet",
                                        // style: greyTextFont.copyWith(
                                        //   fontSize: 16,
                                        //   fontWeight: FontWeight.w400,
                                        // ),
                                      ),
                                      Text(
                                        NumberFormat.currency(
                                          locale: 'id_ID',
                                          decimalDigits: 0,
                                          symbol: 'IDR ',
                                        ).format(
                                            double.parse(user.walletAmount)),
                                        style: TextStyle(
                                          color:
                                              double.parse(user.walletAmount) >=
                                                      total
                                                  ? Colors.black
                                                  : Color(0xFFFF5C83),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 250,
                                  height: 46,
                                  margin: EdgeInsets.only(
                                    top: 36,
                                    bottom: 44,
                                  ),
                                  child: ElevatedButton(
                                    // style: ButtonStyle(
                                    //   backgroundColor:
                                    //       MaterialStateProperty.all<Color>(
                                    //           double.parse(user.walletAmount) >=
                                    //                   total
                                    //               ? Color(0xFF3E9D9D)
                                    //               : Color(0xFF503E9D)),
                                    //   shape: MaterialStateProperty.all<
                                    //           RoundedRectangleBorder>(
                                    //       RoundedRectangleBorder(
                                    //     borderRadius: BorderRadius.circular(8),
                                    //   )),
                                    // ),
                                    // child: Text(
                                    //     // double.parse(user.walletAmount) >= total
                                    //     // ?
                                    //     "Checkout Now"
                                    //     // : "Top Up My Wallet",
                                    //     // style:
                                    //     //     whiteTextFont.copyWith(fontSize: 16),
                                    //     ),
                                    child: Text(
                                      "Checkout",
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
                                        )),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color(0xff2f3980))),
                                    onPressed: () {
                                      if (double.parse(user.walletAmount) >=
                                          total) {
                                        // Transactions transaction = Transactions(
                                        //   userID: user.id,
                                        //   title:
                                        //       widget.ticket.movie.title,
                                        //   subtitle: widget.ticket.theater.name,
                                        //   time: DateTime.now(),
                                        //   amount: -total,
                                        //   picture: widget
                                        //       .ticket.movie.posterPath,
                                        // );
                                        context
                                            .read<UserBloc>()
                                            .add(BuyTicketByUser(total));
                                        context.read<TicketBloc>().add(
                                            BuyTicket(
                                                user.id,
                                                widget.ticket.copyWith(
                                                    totalPrice: total)));
                                        context.read<PageBloc>().add(
                                              OpenMainPage(),
                                            );
                                      } else {}
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
