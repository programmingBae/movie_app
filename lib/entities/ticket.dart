import 'package:equatable/equatable.dart';
import 'package:movie_app/entities/movie.dart';
import 'package:movie_app/entities/theater.dart';

class Ticket extends Equatable {
  /// ------------------------------------------
  /// [Ticket Class]
  /// This class is used to modeling ticket data
  /// ------------------------------------------
  //* Property model
  final Movie movie;
  final Theater theater;
  final DateTime time;
  final String bookingCode;
  final List<String>? seats;
  final String name;
  final int? totalPrice;

  //* Constructor model
  Ticket(
    this.movie,
    this.theater,
    this.time,
    this.bookingCode,
    this.seats,
    this.name,
    this.totalPrice,
  );

  //* Method to override property value of model
  Ticket copyWith({
    Movie? movie,
    Theater? theater,
    DateTime? time,
    String? bookingCode,
    List<String>? seats,
    String? name,
    int? totalPrice,
  }) =>
      Ticket(
        movie ?? this.movie,
        theater ?? this.theater,
        time ?? this.time,
        bookingCode ?? this.bookingCode,
        seats ?? this.seats,
        name ?? this.name,
        totalPrice ?? this.totalPrice,
      );

  //* Getter to generate seat list as String
  String get seatsInString {
    String string = '';

    for (var seat in seats!) {
      string += seat + ((seat != seats!.last) ? ', ' : '');
    }

    return string;
  }

  //* Passing property model to list of object
  @override
  List<Object> get props => [
        movie,
        theater,
        time,
        bookingCode,
        seats!,
        name,
        totalPrice!,
      ];
}
