import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/entities/user.dart';
import 'package:movie_app/repository/database_services.dart';

import '../../repository/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>(_onEvent);
  }

  Future<void> _onEvent(
    UserEvent event,
    Emitter<UserState> emit,
  ) async {
    // TODO: implement event handler
    if (event is LoadUser) {
      User user = await UserRepository.getUser(event.uid);
      emit(UserLoaded(user));
    } else if (event is TopUp) {
      if (state is UserLoaded) {
        try {
          User updatedUser = (state as UserLoaded).user.copyWith(
                walletAmount:
                    (double.parse((state as UserLoaded).user.walletAmount) +
                            event.amount)
                        .toString(),
              );

          await DatabaseServices.topUp(
              fullName: updatedUser.fullName,
              email: updatedUser.email,
              password: updatedUser.password,
              amount: updatedUser.walletAmount,
              uid: updatedUser.id);

          emit(UserLoaded(updatedUser));
        } catch (e) {
          print(e);
        }
      }
    }
  }
}
