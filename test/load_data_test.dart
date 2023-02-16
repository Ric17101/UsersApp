import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:usersapp/api/services.dart';
import 'package:usersapp/bloc/bloc.dart';
import 'package:usersapp/bloc/events.dart';
import 'package:usersapp/bloc/state.dart';

void main() async {
  group('UserBloc', () {
    blocTest(
      'emits [] when nothing is fetched',
      build: () => UserBloc(UserServices()),
      expect: () => [],
    );

    blocTest(
      'emits [isA<UserLoadInProgress>()] when UserRequested is added',
      build: () => UserBloc(UserServices()),
      act: (bloc) => bloc.add(UserRequested()),
      expect: () => [isA<UserLoadInProgress>()],
    );
  });
}
