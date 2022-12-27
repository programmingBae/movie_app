import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/bloc/ticket_event.dart';
import 'package:movie_app/bloc/bloc/ticket_state.dart';
import 'package:movie_app/entities/ticket.dart';
import 'package:movie_app/repository/ticket_services.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc() : super(TicketState([])) {
    on<TicketEvent>(_onEvent);
  }
  Future<void> _onEvent(
    TicketEvent event,
    Emitter<TicketState> emit,
  ) async {
    // TODO: implement event handler
    // if (event is FetchMovies) {
    //   List<Movie> movies = await MovieRepository().getMovies("1");
    //   emit(MovieLoaded(movies));
    // }
    if (event is BuyTicket) {
      await TicketServices.saveTicket(event.userID, event.ticket);

      List<Ticket> tickets = state.tickets + [event.ticket];

      emit(TicketState(tickets));
    } else if (event is GetListOfTickets) {
      List<Ticket> tickets = await TicketServices.getTickets(event.userID);

      emit(TicketState(tickets));
    }
  }
}
