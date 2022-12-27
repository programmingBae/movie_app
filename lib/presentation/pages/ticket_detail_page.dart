import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/bloc/bloc/page_bloc.dart';
import 'package:movie_app/entities/ticket.dart';
import 'package:movie_app/extensions/date_time_extension.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketDetailPage extends StatelessWidget {
  final Ticket ticket;

  TicketDetailPage(this.ticket);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(
              OpenMainPage(
                bottomNavBarIndex: 1,
                isExpired: ticket.time.isBefore(DateTime.now()),
              ),
            );
        throw Error();
      },
      child: Scaffold(
        backgroundColor: Color(0xFFF6F7F9),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onTap: () {
                            context.read<PageBloc>().add(
                                  OpenMainPage(
                                    bottomNavBarIndex: 1,
                                    isExpired:
                                        ticket.time.isBefore(DateTime.now()),
                                  ),
                                );
                          },
                        ),
                      ),
                      Center(
                        child: Text(
                          "Ticket Details",
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 170,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500" +
                              ticket.movie.backdropPath,
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: TicketTopClipper(),
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ticket.movie.title,
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          RatingBar.builder(
                              initialRating:
                                  ticket.movie.voteAverage.toDouble() / 2,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              ignoreGestures: true,
                              itemCount: 5,
                              itemSize: 20,
                              unratedColor: Colors.white,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: ((context, index) {
                                return const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                );
                              }),
                              onRatingUpdate: (rating) {}),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Cinema",
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Text(
                                  ticket.theater.name,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Date & Time",
                              ),
                              Text(
                                ticket.time.dateAndtime,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Seat Numbers",
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Text(
                                  ticket.seatsInString,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order ID",
                              ),
                              Text(
                                ticket.bookingCode,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          generateDashedDivider(
                            MediaQuery.of(context).size.width - 2 * 24 - 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: TicketBottomClipper(),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name",
                              ),
                              Text(
                                ticket.name,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Paid",
                              ),
                              Text(
                                NumberFormat.currency(
                                  locale: "id_ID",
                                  decimalDigits: 0,
                                  symbol: "IDR ",
                                ).format(ticket.totalPrice),
                              ),
                            ],
                          ),
                          QrImage(
                            version: 6,
                            foregroundColor: Colors.black,
                            errorCorrectionLevel: QrErrorCorrectLevel.M,
                            padding: EdgeInsets.all(0),
                            size: 100,
                            data: ticket.bookingCode,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TicketTopClipper extends CustomClipper<Path> {
  double radius = 15;

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - radius);
    path.quadraticBezierTo(radius, size.height - radius, radius, size.height);
    path.lineTo(size.width - radius, size.height);
    path.quadraticBezierTo(size.width - radius, size.height - radius,
        size.width, size.height - radius);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TicketBottomClipper extends CustomClipper<Path> {
  double radius = 15;

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, radius);
    path.quadraticBezierTo(size.width - radius, radius, size.width - radius, 0);
    path.lineTo(radius, 0);
    path.quadraticBezierTo(radius, radius, 0, radius);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

Widget generateDashedDivider(double width) {
  int n = width ~/ 5;

  return Row(
    children: List.generate(
      n,
      (index) => (index % 2 == 0)
          ? Container(
              height: 2,
              width: width / n,
              color: Color(0xFFE4E4E4),
            )
          : SizedBox(
              width: width / n,
            ),
    ),
  );
}
