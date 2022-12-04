import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/repository/movie_repository.dart';

import '../../entities/movie.dart';
import '../../entities/tresult.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<MovieEvent>(_onEvent);
  }

  Future<void> _onEvent(
    MovieEvent event,
    Emitter<MovieState> emit,
  ) async {
    // TODO: implement event handler
    if (event is FetchMovies) {
      List<Movie> movies = await MovieRepository().getMovies("1");
      emit(MovieLoaded(movies));
    }
  }

//   @override
//   Stream<MovieState> mapEventToState(
//     MovieEvent event,
//   ) async* {
//     if (event is FetchMovies) {
  // List<Movie> movies =
  //     (await MovieRepository().getMovies("1")) as List<Movie>;

  // yield MovieLoaded(movies);
//     }
//   }
// }
}
