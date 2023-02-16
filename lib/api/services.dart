import 'package:dio/dio.dart';
import 'package:usersapp/models/user.dart';

abstract class UsersRepo {
  Future<List<User>> getUserList();
}

class UserServices implements UsersRepo {
  static const _baseUrl =
      'https://gist.githubusercontent.com/dustincatap/66d48847b3ca07af7cef789d6ac8fee8/raw/550798be0efa8b98f6924cfb4ad812cd290f568a/users.json';
  final Dio _dio = Dio();

  @override
  Future<List<User>> getUserList() async {
    Response response = await _dio.get(_baseUrl);
    List<User> users = userFromJson(response.data);
    return users;
  }
}
