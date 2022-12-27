part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class OpenSplashPage extends PageEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OpenSignInPage extends PageEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OpenSignUpPage extends PageEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OpenMainPage extends PageEvent {
  final int bottomNavBarIndex;
  final bool isExpired;

  OpenMainPage({this.bottomNavBarIndex = 0, this.isExpired = false});

  @override
  List<Object> get props => [bottomNavBarIndex, isExpired];
}

class OpenTopUpPage extends PageEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OpenMovieDetailPage extends PageEvent {
  @override
  // TODO: implement props
  final Movie movie;

  OpenMovieDetailPage(this.movie);

  @override
  List<Object> get props => [movie];
}

class OpenBookSchedulePage extends PageEvent {
  final Movie movie;

  OpenBookSchedulePage(this.movie);

  @override
  List<Object> get props => [movie];
}

class OpenSelectSeatPage extends PageEvent {
  final Ticket ticket;

  OpenSelectSeatPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class OpenCheckoutPage extends PageEvent {
  final Ticket ticket;

  OpenCheckoutPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class OpenTicketDetailPage extends PageEvent {
  final Ticket ticket;

  OpenTicketDetailPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}
