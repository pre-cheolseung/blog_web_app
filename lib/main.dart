import 'package:flutter/material.dart';

import 'package:blog_web_app/screen/home_screen.dart';

void main() {
  // 플러터 프레임워크가 앱을 실행할 준비가 될 때까지 대기
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}