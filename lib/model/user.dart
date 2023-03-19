class User {
  final String id;
  final String password;
  final String email;

  User({
    required this.id,
    required this.password,
    required this.email,
  });

  User.fromJson({
    required Map<String, dynamic> json,
  })  : id = json['id'],
        password = json['password'],
        email = json['email'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'password': password,
      'email': email,
    };
  }
}
