import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/entities/movie.dart';
import 'package:movie_app/entities/ticket.dart';
import 'package:movie_app/repository/movie_repository.dart';

import '../entities/theater.dart';

class TicketServices {
  /// -------------------------------------------------------
  /// [Ticket Services Class]
  /// This class is used to handling ticketing data firestore
  /// -------------------------------------------------------
  //* Instancing firestore ticket collection
  static CollectionReference ticketCollection =
      FirebaseFirestore.instance.collection('tickets');

  //* Method to saving ticket data to firestore
  static Future<void> saveTicket(String id, Ticket ticket) async {
    await ticketCollection.doc().set({
      'movieID': ticket.movie.id,
      'userID': id ?? "",
      'theaterName': ticket.theater.name,
      'time': ticket.time.millisecondsSinceEpoch ??
          DateTime.now().millisecondsSinceEpoch,
      'bookingCode': ticket.bookingCode,
      'seats': ticket.seatsInString,
      'name': ticket.name,
      'totalPrice': ticket.totalPrice,
    });
  }

  //* Method to getting ticket data from firestore
  static Future<List<Ticket>> getTickets(String userId) async {
    QuerySnapshot snapshot = await ticketCollection.get();

    var documents =
        snapshot.docs.where((document) => document["userID"] == userId);

    List<Ticket> tickets = [];

    for (var document in documents) {
      Movie movie = await MovieRepository().getMovieById(document['movieID']);
      tickets.add(
        Ticket(
          movie,
          Theater(document['theaterName']),
          DateTime.fromMillisecondsSinceEpoch(document['time']),
          document['bookingCode'],
          document['seats'].toString().split(','),
          document['name'],
          document['totalPrice'],
        ),
      );
    }

    return tickets;
  }
}
