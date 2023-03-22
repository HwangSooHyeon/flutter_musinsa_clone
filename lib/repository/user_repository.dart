import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user.dart';

class UserRepository {
  final FirebaseFirestore instance;

  UserRepository({
    required this.instance,
  });

  Future<User?> getUser({
    required String id,
  }) async {
    final response = await instance.collection('user').doc(id).get();
    if (response.data() == null) {
      return null;
    }
    return User(
      id: response.data()?['id'] ?? '',
      password: response.data()?['password'] ?? '',
      email: response.data()?['email'] ?? '',
    );
  }

  Future<bool> createUser({
    required User user,
  }) async {
    try {
      await instance.collection('user').doc(user.id).set(user.toJson());
      return true;
    } catch (e) {
      print('계정 생성 중 에러 발생: $e');
      return false;
    }
  }
}
