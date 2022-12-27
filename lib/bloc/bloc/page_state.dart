part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class PageInitial extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnSignInPage extends PageState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnSignUpPage extends PageState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnMainPage extends PageState {
  final int bottomNavBarIndex;
  final bool isExpired;

  OnMainPage({this.bottomNavBarIndex = 0, this.isExpired = false});

  @override
  List<Object> get props => [bottomNavBarIndex, isExpired];
}

class OnTopUpPage extends PageState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnMovieDetailPage extends PageState {
  @override
  final Movie movie;

  OnMovieDetailPage(this.movie);

  @override
  List<Object> get props => [movie];
}

class OnBookSchedulePage extends PageState {
  final Movie movie;

  OnBookSchedulePage(this.movie);

  @override
  List<Object> get props => [movie];
}

class OnSelectSeatPage extends PageState {
  final Ticket ticket;

  OnSelectSeatPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class OnCheckoutPage extends PageState {
  final Ticket ticket;

  OnCheckoutPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class OnTicketDetailPage extends PageState {
  final Ticket ticket;

  OnTicketDetailPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}
