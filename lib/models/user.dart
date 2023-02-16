import 'dart:convert';

List<User> albumFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String albumToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  String? id;
  String? name;
  String? imageUrl;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
