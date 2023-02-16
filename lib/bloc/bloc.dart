import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usersapp/api/services.dart';
import 'package:usersapp/bloc/events.dart';
import 'package:usersapp/bloc/state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this.userRepository) : super(UserInitial()) {
    on<UserRequested>(_onUserRequested);
  }

  final UsersRepo userRepository;

  void _onUserRequested(UserRequested event, Emitter<UserState> emit) async {
    emit(UserLoadInProgress());
    try {
      final user = await userRepository.getUserList();
      emit(UserLoadSuccess(user));
    } catch (_) {
      emit(UserLoadFailure());
    }
  }
}
