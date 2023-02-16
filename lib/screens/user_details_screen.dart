import 'package:flutter/material.dart';
import 'package:usersapp/models/user.dart';
import 'package:usersapp/screens/widget/user_item.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    required this.user,
    super.key,
  });

  final User? user;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text('${user?.name ?? ''} Details')),
      body: UserItem(
        title: user?.name ?? '',
        details: user?.id ?? '',
        thumbnail: user?.imageUrl ?? '',
      ),
    );
}
