import 'package:usersapp/models/user.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoadInProgress extends UserState {}

class UserLoadFailure extends UserState {}

class UserLoadSuccess extends UserState {
  UserLoadSuccess(this.users);

  final List<User> users;
}
