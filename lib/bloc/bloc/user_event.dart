part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadUser extends UserEvent {
  final String uid;

  LoadUser(this.uid);

  @override
  List<Object> get props => [uid];
}

class TopUp extends UserEvent {
  final int amount;

  TopUp(this.amount);

  @override
  List<Object> get props => [amount];
}
