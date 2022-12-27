import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/entities/ticket.dart';

import '../../entities/movie.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(PageInitial()) {
    on<PageEvent>(_onEvent);
  }
  Future<void> _onEvent(
    PageEvent event,
    Emitter<PageState> emit,
  ) async {
    // TODO: implement event handler
    // if (event is FetchMovies) {
    //   List<Movie> movies = await MovieRepository().getMovies("1");
    //   emit(MovieLoaded(movies));
    // }

    if (event is OpenSplashPage) {
      emit(OnSplashPage());
    } else if (event is OpenSignInPage) {
      emit(OnSignInPage());
    } else if (event is OpenSignUpPage) {
      emit(OnSignUpPage());
    } else if (event is OpenMainPage) {
      emit(OnMainPage(
          bottomNavBarIndex: event.bottomNavBarIndex,
          isExpired: event.isExpired));
    } else if (event is OpenTopUpPage) {
      emit(OnTopUpPage());
    } else if (event is OpenMovieDetailPage) {
      emit(OnMovieDetailPage(event.movie));
    } else if (event is OpenBookSchedulePage) {
      emit(OnBookSchedulePage(event.movie));
    } else if (event is OpenSelectSeatPage) {
      emit(OnSelectSeatPage(event.ticket));
    } else if (event is OpenCheckoutPage) {
      emit(OnCheckoutPage(event.ticket));
    } else if (event is OpenTicketDetailPage) {
      emit(OnTicketDetailPage(event.ticket));
    }
  }
}
