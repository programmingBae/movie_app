import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/bloc/bloc/page_bloc.dart';
import 'package:movie_app/bloc/bloc/ticket_bloc.dart';
import 'package:movie_app/bloc/bloc/ticket_state.dart';

import '../../entities/ticket.dart';

class TicketPage extends StatefulWidget {
  final bool isExpiredTicket;

  TicketPage({this.isExpiredTicket = false});

  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  late bool isExpiredTickets;

  @override
  void initState() {
    super.initState();

    isExpiredTickets = widget.isExpiredTicket;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd4e1f4),
      body: Stack(
        children: [
          // note: CONTENT
          BlocBuilder<TicketBloc, TicketState>(
            builder: (_, ticketState) => Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: TicketViewer(isExpiredTickets
                  ? ticketState.tickets
                      .where((ticket) => ticket.time.isBefore(DateTime.now()))
                      .toList()
                  : ticketState.tickets
                      .where((ticket) => !ticket.time.isBefore(DateTime.now()))
                      .toList()),
            ),
          ),

          // note: HEADER
          SizedBox(
            height: 150,
          ),
          SafeArea(
            child: ClipPath(
              clipper: HeaderClipper(),
              child: Container(
                height: 113,
                color: Color(0xff2c3e50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 24,
                        bottom: 32,
                      ),
                      child: Text("My Tickets",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          )),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            setState(() {
                              isExpiredTickets = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text("Newest",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 4,
                                width: MediaQuery.of(context).size.width * 0.5,
                                color: !isExpiredTickets
                                    ? Color(0xFF503E9D)
                                    : Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            setState(() {
                              isExpiredTickets = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text("Oldest",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 4,
                                width: MediaQuery.of(context).size.width * 0.5,
                                color: isExpiredTickets
                                    ? Color(0xFF503E9D)
                                    : Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(0, size.height, 20, size.height);
    path.lineTo(size.width - 20, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TicketViewer extends StatelessWidget {
  final List<Ticket> tickets;

  TicketViewer(this.tickets);

  @override
  Widget build(BuildContext context) {
    var sortedTickets = tickets;
    sortedTickets
        .sort((ticket1, ticket2) => ticket1.time.compareTo(ticket2.time));

    return ListView.builder(
      itemCount: sortedTickets.length,
      itemBuilder: (_, index) => GestureDetector(
        onTap: () {
          context
              .read<PageBloc>()
              .add(OpenTicketDetailPage(sortedTickets[index]));
        },
        child: Container(
          color: Color(0xffd4e1f4),
          margin: EdgeInsets.only(
            top: index == 0 ? 133 : 20,
            bottom: index == sortedTickets.length - 1 ? 100 : 0,
          ),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500" +
                          sortedTickets[index].movie.posterPath,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 2 * 24 - 70 - 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sortedTickets[index].movie.title,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      sortedTickets[index].theater.name ?? "",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
