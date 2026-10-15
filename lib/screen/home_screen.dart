import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // const 생성자 : 최초 선언 후 변경 불가능한 빌드 타임 함수
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Home Screen'),
    );
  }
}