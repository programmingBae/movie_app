import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/bloc/bloc/page_bloc.dart';
import 'package:movie_app/entities/ticket.dart';

import '../widgets/selectable_box.dart';

class SelectSeatPage extends StatefulWidget {
  final Ticket ticket;

  SelectSeatPage(this.ticket);

  @override
  _SelectSeatPageState createState() => _SelectSeatPageState();
}

class _SelectSeatPageState extends State<SelectSeatPage> {
  List<String> selectedSeats = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(OpenBookSchedulePage(widget.ticket.movie));
        throw Error();
      },
      child: Scaffold(
        backgroundColor: Color(0xffd4e1f4),
        body: Stack(
          children: [
            Container(
              color: Color(0xFF2C1F63),
            ),
            SafeArea(
              child: Container(
                color: Color(0xffd4e1f4),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Container(
                        //       margin: EdgeInsets.only(
                        //         left: 24,
                        //         top: 36,
                        //       ),
                        //       padding: EdgeInsets.all(1),
                        //       child: GestureDetector(
                        //         onTap: () {
                        //           context.read<PageBloc>().add(
                        //               OpenBookSchedulePage(
                        //                   widget.ticket.movie));
                        //         },
                        //         child: Icon(
                        //           Icons.arrow_back,
                        //           color: Colors.black,
                        //         ),
                        //       ),
                        //     ),
                        //     Padding(
                        //       padding: EdgeInsets.only(top: 20, right: 24),
                        //       child: Row(
                        //         children: [
                        //           Container(
                        //             margin: EdgeInsets.only(right: 16),
                        //             width:
                        //                 MediaQuery.of(context).size.width * 0.4,
                        //             child: Text(
                        //               widget.ticket.movie.title,
                        //               maxLines: 2,
                        //               overflow: TextOverflow.clip,
                        //               textAlign: TextAlign.end,
                        //               // style: blackTextFont.copyWith(
                        //               //   fontSize: 20,
                        //               //   height: 1.4,
                        //               // ),
                        //             ),
                        //           ),
                        //           Container(
                        //             width: 60,
                        //             height: 60,
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(8),
                        //               image: DecorationImage(
                        //                 image: NetworkImage(
                        //                   "https://image.tmdb.org/t/p/" +
                        //                       'w154' +
                        //                       widget.ticket.movie.posterPath,
                        //                 ),
                        //                 fit: BoxFit.cover,
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        Container(
                          width: 277,
                          height: 84,
                          margin: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                              // image: DecorationImage(
                              //   image: AssetImage("assets/screen.png"),
                              // ),
                              ),
                        ),
                        generateSeats(),
                        Container(
                          margin: EdgeInsets.only(
                            left: 54,
                            right: 54,
                            top: 7,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SelectableBox(
                                    "",
                                    width: 20,
                                    height: 20,
                                    onTap: null,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Available",
                                    // style: greyTextFont.copyWith(
                                    //   fontWeight: FontWeight.normal,
                                    //   fontSize: 10,
                                    // ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SelectableBox(
                                    "",
                                    width: 20,
                                    height: 20,
                                    isEnabled: false,
                                    onTap: null,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Booked",
                                    // style: greyTextFont.copyWith(
                                    //   fontWeight: FontWeight.normal,
                                    //   fontSize: 10,
                                    // ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SelectableBox(
                                    "",
                                    width: 20,
                                    height: 20,
                                    isSelected: true,
                                    onTap: null,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Selected",
                                    // style: greyTextFont.copyWith(
                                    //   fontWeight: FontWeight.normal,
                                    //   fontSize: 10,
                                    // ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 50,
                            child: ElevatedButton(
                              child: Text(
                                "Book Now",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  )),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          selectedSeats.length > 0
                                              ? Color(0xff2f3980)
                                              : Color(0xFFE4E4E4))),
                              onPressed: selectedSeats.length > 0
                                  ? () {
                                      context.read<PageBloc>().add(
                                            OpenCheckoutPage(
                                              widget.ticket.copyWith(
                                                  seats: selectedSeats),
                                            ),
                                          );
                                    }
                                  : null,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
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

  Column generateSeats() {
    List<int> numberOfSeats = [5, 5, 5, 5, 5];
    List<Widget> widgets = [];

    for (int i = 0; i < numberOfSeats.length; i++) {
      widgets.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              numberOfSeats[i],
              (index) => Padding(
                    padding: EdgeInsets.only(
                      right: index < numberOfSeats[i] - 1 ? 16 : 0,
                      bottom: 16,
                    ),
                    child: SelectableBox(
                      "${String.fromCharCode(i + 65)}${index + 1}",
                      width: 40,
                      height: 40,
                      isSelected: selectedSeats.contains(
                          "${String.fromCharCode(i + 65)}${index + 1}"),
                      isEnabled: index != numberOfSeats.last - 1,
                      onTap: () {
                        String seatNumber =
                            "${String.fromCharCode(i + 65)}${index + 1}";
                        setState(() {
                          if (index != numberOfSeats.last - 1) {
                            if (selectedSeats.contains(seatNumber)) {
                              selectedSeats.remove(seatNumber);
                            } else {
                              selectedSeats.add(seatNumber);
                            }
                          }
                        });
                      },
                    ),
                  )),
        ),
      );
    }

    return Column(
      children: widgets,
    );
  }
}
