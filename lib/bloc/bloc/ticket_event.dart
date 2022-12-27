import 'package:equatable/equatable.dart';
import 'package:movie_app/entities/ticket.dart';

abstract class TicketEvent extends Equatable {
  const TicketEvent();
}

class GetListOfTickets extends TicketEvent {
  final String userID;

  GetListOfTickets(this.userID);

  @override
  List<Object> get props => [userID];
}

class BuyTicket extends TicketEvent {
  final String userID;
  final Ticket ticket;

  BuyTicket(this.userID, this.ticket);

  @override
  List<Object> get props => [userID, ticket];
}
