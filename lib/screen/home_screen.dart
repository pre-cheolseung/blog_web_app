import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // const 생성자 : 최초 선언 후 변경 불가능한 빌드 타임 함수
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 앱바 위젯 추가
      appBar: AppBar(
        // 배경색 지정
        backgroundColor: Colors.orange,
        // 가운데 정렬
        centerTitle: true,
        // 앱 타이틀 설정
        title: Text('Code Factory'),
      ),
      body: Text('Home Screen'),
    );
  }
}