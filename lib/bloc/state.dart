import 'package:usersapp/bloc/events.dart';
import 'package:usersapp/models/user.dart';

class UserRequested extends UserEvent {
  UserRequested(this.user);

  final User user;
}

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoadInProgress extends UserState {}

class UserLoadFailure extends UserState {}

class UserLoadSuccess extends UserState {
  UserLoadSuccess(this.users);

  final List<User> users;
}
