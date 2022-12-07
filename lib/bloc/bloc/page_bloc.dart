import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
      emit(OnMainPage());
    } else if (event is OpenTopUpPage) {
      emit(OnTopUpPage());
    }
  }
}
