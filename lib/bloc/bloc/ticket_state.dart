import 'package:equatable/equatable.dart';

import '../../entities/ticket.dart';

class TicketState extends Equatable {
  final List<Ticket> tickets;

  TicketState(this.tickets);

  @override
  List<Object> get props => [tickets];
}
