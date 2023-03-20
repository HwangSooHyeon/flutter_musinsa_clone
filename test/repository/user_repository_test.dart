import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_musinsa_clone/model/user.dart';
import 'package:flutter_musinsa_clone/repository/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  final instance = FakeFirebaseFirestore();
  final user = User(
      id: 'mikaelh',
      password:
          '99ff168a7df53d9d57010acad9ebcecbd06e6e77ee0503e4a2e8255063da251e',
      email: 'mikaelh@naver.com');
  await instance.collection('user').doc(user.id).set(user.toJson());
  final userRepository = UserRepository();

  test('firestore 수신 테스트', () async {
    final response =
        await userRepository.getUser(id: 'mikaelh', instance: instance);
    expect(response.toString(),
        'id: mikaelh, password: 99ff168a7df53d9d57010acad9ebcecbd06e6e77ee0503e4a2e8255063da251e, email: mikaelh@naver.com');
  });
}
