import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/bloc/bloc/page_bloc.dart';
import 'package:movie_app/entities/theater.dart';
import 'package:movie_app/entities/ticket.dart';

import 'package:movie_app/presentation/widgets/date_card.dart';
import 'package:random_string/random_string.dart';

import '../../bloc/bloc/user_bloc.dart';
import '../../entities/movie.dart';
import '../widgets/selectable_box.dart';

class BookSchedulePage extends StatefulWidget {
  final Movie movie;

  const BookSchedulePage(this.movie);

  @override
  State<BookSchedulePage> createState() => _BookSchedulePageState();
}

class _BookSchedulePageState extends State<BookSchedulePage> {
  List<DateTime>? dates;
  DateTime? selectedDate;
  int? selectedTime;
  Theater? selectedTheater;
  bool isValid = false;

  @override
  void initState() {
    super.initState();

    dates =
        List.generate(7, (index) => DateTime.now().add(Duration(days: index)));
    selectedDate = dates![0];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(OpenMovieDetailPage(widget.movie));
        throw Error();
      },
      child: Scaffold(
        backgroundColor: Color(0xffd4e1f4),
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
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 36,
                            left: 24,
                          ),
                          padding: EdgeInsets.all(1),
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .read<PageBloc>()
                                  .add(OpenMovieDetailPage(widget.movie));
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(24, 20, 24, 16),
                      child: Text(
                        "Choose Date",
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 24),
                      height: 90,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dates?.length,
                        itemBuilder: (_, index) => Container(
                          margin: EdgeInsets.only(
                            left: (index == 0) ? 24 : 0,
                            right: (index < dates!.length - 1) ? 16 : 24,
                          ),
                          child: DateCard(
                            dates![index],
                            isSelected: selectedDate == dates![index],
                            onTap: () {
                              setState(() {
                                isValid = false;
                                selectedTime = null;
                                selectedDate = dates![index];
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    generateTimeTable(),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: BlocBuilder<UserBloc, UserState>(
                        builder: (_, userState) => Container(
                          width: 300,
                          height: 50,
                          child: ElevatedButton(
                            child: Text(
                              "Select Seat",
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
                                    MaterialStateProperty.all<Color>((isValid)
                                        ? Color(0xff2f3980)
                                        : Color(0xFFE4E4E4))),
                            // (isValid) ? Color(0xFF503E9D) : Color(0xFFE4E4E4)
                            onPressed: () {
                              if (isValid) {
                                context.read<PageBloc>().add(
                                      OpenSelectSeatPage(
                                        Ticket(
                                          widget.movie,
                                          selectedTheater!,
                                          DateTime(
                                            selectedDate!.year,
                                            selectedDate!.month,
                                            selectedDate!.day,
                                            selectedTime!,
                                          ),
                                          randomAlphaNumeric(12).toUpperCase(),
                                          null,
                                          (userState as UserLoaded)
                                              .user
                                              .fullName,
                                          null,
                                        ),
                                      ),
                                    );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
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

  Column generateTimeTable() {
    List<int> schedule = List.generate(7, (index) => 10 + index * 2);
    List<Widget> widgets = [];

    for (var theater in dummyTheaters) {
      widgets.add(
        Container(
          margin: EdgeInsets.fromLTRB(24, 0, 24, 16),
          child: Text(
            theater.name,
          ),
        ),
      );

      widgets.add(
        Container(
          height: 50,
          margin: EdgeInsets.only(bottom: 20),
          child: ListView.builder(
            itemCount: schedule.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => Container(
              margin: EdgeInsets.only(
                left: (index == 0) ? 24 : 0,
                right: (index < schedule.length - 1) ? 16 : 24,
              ),
              child: SelectableBox(
                "${schedule[index]}:00",
                height: 50,
                isSelected: selectedTheater == theater &&
                    selectedTime == schedule[index],
                isEnabled: schedule[index] > DateTime.now().hour ||
                    selectedDate!.day != DateTime.now().day,
                onTap: () {
                  setState(() {
                    selectedTheater = theater;
                    if (schedule[index] > DateTime.now().hour ||
                        selectedDate!.day != DateTime.now().day) {
                      selectedTime = schedule[index];
                      isValid = true;
                    }
                  });
                },
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}
