import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user.dart';

class UserRepository {
  Future<User?> getUser(
      {required String id, required FirebaseFirestore instance}) async {
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
}
