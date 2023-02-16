import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usersapp/api/services.dart';
import 'package:usersapp/bloc/bloc.dart';
import 'package:usersapp/bloc/events.dart';
import 'package:usersapp/bloc/state.dart';
import 'package:usersapp/models/user.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  UsersScreenState createState() => UsersScreenState();
}

class UsersScreenState extends State<UsersScreen> {
  final UserBloc _userBloc = UserBloc(UserServices());

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  _loadUsers() async {
    _userBloc.add(UserRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _userBloc,
      child: Scaffold(
        appBar: AppBar(title: const Text('Users')),
        body: Container(child: _body()),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        BlocBuilder<UserBloc, UserState>(
          builder: (BuildContext context, UserState state) {
            if (state is UserLoadFailure) {
              return Center(
                child: ElevatedButton(
                  onPressed: () async => _loadUsers(),
                  child: const Text('Tap to Retry.'),
                ),
              );
            }
            if (state is UserLoadSuccess) {
              List<User> user = state.users;
              return _list(user);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ],
    );
  }

  Widget _list(List<User> users) {
    return Expanded(
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (_, index) {
          User user = users[index];
          return ListTile(
            title: Text(user.name ?? ''),
            subtitle: Text(
              user.id ?? '',
              overflow: TextOverflow.visible,
              softWrap: true,
            ),
          );
        },
      ),
    );
  }
}
