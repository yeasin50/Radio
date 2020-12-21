import 'dart:convert';

class User {
  String name;
  int age;

  User({this.name, this.age});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      age: json['age'] as int,
    );
  }

  @override
  String toString() {
    return '{ ${this.name}, ${this.age} }';
  }
}

main() {
  var js1 = '[{"name": "bezkoder", "age": 34}, {"name": "Aer", "age": 323}]';
  var js2 =
      '{"Data":[{"name": "bezkoder", "age": 34}, {"name": "Aer", "age": 323}]}';

  var _json1 = jsonDecode(js1) as List;

  var _json2 = jsonDecode(js2)["Data"] as List;
  List<User> users = _json2.map((user) => User.fromJson(user)).toList();

  users.forEach((element) {
    print(element.name);
  });
  // User user = User.fromJson(_json);
  // print(user.name);
  // print(user.age);
}
