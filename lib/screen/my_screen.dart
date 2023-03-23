import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_musinsa_clone/screen/signed_in_screen.dart';
import 'package:flutter_musinsa_clone/screen/unsigned_in_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyScreen extends StatefulWidget {
  final ScrollController scrollController;

  const MyScreen({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  final secureStorage = FlutterSecureStorage();
  dynamic userInfo;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _getUserInfo();
    });
  }

  Future<bool> _getUserInfo() async {
    userInfo = await secureStorage.read(key: 'signIn');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.topCenter,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: FutureBuilder(
          future: _getUserInfo(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }

            return SingleChildScrollView(
              controller: widget.scrollController,
              child: userInfo == null
                  ? UnsignedInScreen(
                secureStorage: secureStorage,
              )
                  : SignedInScreen(
                userInfo: userInfo.toString(),
                secureStorage: secureStorage,
              ),
            );
          }
        ),
      ),
    );
  }
}
